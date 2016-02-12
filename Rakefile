def run_tests(platform, browser, version, junit_dir)
  system("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" JUNIT_DIR=\"#{junit_dir}\" parallel_cucumber features -n 20")
end

# Windows 10 and supported Edge xx version
task :windows_10_edge do
  run_tests('Windows 10', 'microsoftedge', '20.10240', 'junit_reports/windows_10_edge')
end

# Windows 8.1 and supported Chrome xx version
task :windows_8_1_chrome do
  run_tests('Windows 8.1', 'chrome', '48', 'junit_reports/windows_8_1_chrome')
end

# Windows 7 and supported Firefox xx version
task :windows_7_firefox do
  run_tests('Windows 7', 'firefox', '44', 'junit_reports/windows_7_firefox')
end

# OS X 10.x and supported Chrome xx version
task :os_x_10_10_chrome do
  run_tests('OS X 10.10', 'chrome', '48', 'junit_reports/os_x_chrome')
end

# OS X 10.x and supported Safari x version
task :os_x_10_10_safari do
  run_tests('OS X 10.10', 'safari', '8', 'junit_reports/os_x_safari')
end

# Task to run all the above configurations in parallel
multitask :test_sauce => [
    :windows_10_edge,
    :windows_8_1_chrome,
    :windows_7_firefox,
    :os_x_10_10_chrome,
    :os_x_10_10_safari
] do
  puts 'Running automation'
end