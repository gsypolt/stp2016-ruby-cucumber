Given(/^contextstp$/) do
  visit 'http://www.dominos.com'
end

When(/^actionstp$/) do
  find('.qa-Cl_Menu').click
end

Then(/^outcomestp$/) do
  expect(page).to have_css('#js-categoryArea')
end
