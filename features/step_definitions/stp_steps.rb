Given(/^I have entered a valid address$/) do
  @deliveryLocation = DeliveryLocation.new
  @deliveryLocation.load
end

When(/^I continue to delivery$/) do
  # @deliveryLocation.delivery_address('Hotel','The Westin','1 Old Bayshore Highway','000','Millbrae','CA','94030')
  @deliveryLocation.delivery_address_static
end

Then(/^all entrees available for order$/) do
  expect(page).to have_css('#entreesPage')
end
