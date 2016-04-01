Given(/^I am on the Google homepage$/) do
  # visit 'http://google.com'
  @googleSearch = GoogleSearch.new
  @googleSearch.load
end


Then(/^the search input field appears$/) do
  # expect(page).to have_css('input#lst-ib.gsfi')
  expect(@googleSearch).to have_search_field
end

