Feature: View TV sets section
	As unregistered user
	I want to be able to see all TV sets currently on the market
	So I can decide, which ones will suit my needs best


	Background:
		Given I am on the TV sets review page

	Scenario: Consumer lands on the page for the first time
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
		Given I want to buy a large TV
		When I select the option from the 'Sort by' menu
		Then I should see the TVs with large screen size first

	Scenario: Consumer is interested in the latest releases
		Given I want to see what has been recently released
		When I select the option from the 'Sort by' menu
		Then I should see the latest releases first

	Scenario: Consumer wants to see current best buying TVs

	Scenario: Consumer wants to find, which TVs to avoid

	Scenario: Consumer looks for an advice

	Scenario Outline: Consumer is looking for particuar screen size

	Scenario: Consumer is has a certain budget

	Scenario Outline: Consumer is interested in a certain brand

	Scenario Outline: Consumer is not sure what screen size TV to buy

	Scenario Outline: Consumer wants to explore the differences between screen types

	Scenario Outline: Consumer is looking for a TV based on resolution

	Scenario Outline: Consumer is searching for a TV based on it's features

	Scenario Outline: Consumer would like to find the retailer selling the TV he/she likes
