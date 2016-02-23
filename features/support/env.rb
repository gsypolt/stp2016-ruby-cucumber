begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'selenium-webdriver'
require "capybara/rspec"
require "capybara/cucumber"
require 'page-object'
require 'require_all'
require 'sauce_whisk'


Capybara::DSL
Capybara::RSpecMatchers

begin
	require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'page_objects')}"
rescue
	puts "no page objects found"
end

Before do | scenario |
	# need to configure env variables for browser
  Capybara.default_max_wait_time = 60
  Capybara.default_selector = :css
  Capybara.current_driver = :selenium

  if ENV['LOCAL']
    # Execute selenium tests locally
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.native_events = true
      Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
    end

  else

    Capybara.register_driver :selenium do |app|
      capabilities = {
          :version => ENV['version'],
          :browserName => ENV['browserName'],
          :platform => ENV['platform'],
          :name => "#{scenario.feature.name} - #{scenario.name}"
      }

      url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
      Capybara::Selenium::Driver.new(app, :browser => :remote, :url => url, :desired_capabilities => capabilities)

    end

  end
end

Around do | scenario, block |

	block.call

  if ENV['LOCAL']
      jobname = "#{scenario.feature.name} - #{scenario.name}"
			puts jobname
  else

  	sessionid = ::Capybara.current_session.driver.browser.session_id
	  ::Capybara.current_session.driver.quit

	  # sessionid = Capybara.current_session.driver.browser.session_id
	  jobname = "#{scenario.feature.name} - #{scenario.name}"

	  # Output sessionId and jobname to std out for Sauce OnDemand Plugin to display embeded results
	  puts "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"

		require 'logger'
		logger = ::Logger.new(STDOUT)
		logger.level = Logger::DEBUG
		SauceWhisk.logger = logger

	  job = SauceWhisk::Jobs.fetch sessionid
	  job.name = jobname
	  job.passed = scenario.passed? ? true : false
	  job.save
  end
end
