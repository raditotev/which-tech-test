Feature: View TV sets section
	As a unregistered user
	I want to be able to see latest TV sets
	So I can find, what is currently available


Background:
	Given I am on the TV sets review page

Scenario: Consumer land on the page for the first time
	Then I should be informed about the cookies policy
	And I should see an info description regarding the page

Scenario: Consumer is looking for a most recently reviewed TVs
	Then I should see most recently reviewed TVs

Scenario: Consumer is looking for affordable TV
	Given I want to see the most affordable TVs first
	When I select the option from the 'Sort by' menu
	Then I should see the TVs with the lowest price first

Scenario: Consumer is looking for high end TV
	Given I want to see the most expensive TVs first
	When I select the option from the 'Sort by' menu
	Then I should see the TVs with the highest price first

Scenario: Consumer is looking for a large TV
	Given I want to buy a small TV
	When I select the option from the 'Sort by' menu
	Then I should see the TVs with small screen size first

Scenario: Consumer is interested in the latest releases
	Given I want to see what has been recently released
	When I select the option from the 'Sort by' menu
	Then I should see the latest releases first
