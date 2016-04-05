@stp
Feature: Order Online

As an user, I want to order a pizza for delivery so
that I can stay home

Scenario: Delivery Address
  Given I have entered a valid address
  When I continue to delivery
  Then all entrees available for order
