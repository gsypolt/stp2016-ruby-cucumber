Given(/^I am on the Google homepage$/) do
  visit 'http://google.com'
end


Then(/^the search input field appears$/) do
  expect(page).to have_css('input#lst-ib.gsfi')
end
