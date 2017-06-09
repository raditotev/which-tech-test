Given /^I am on the TV sets review page$/ do
  visit("http://www.which.co.uk/reviews/televisions?sortby=testing_date_desc&page=1")
end

Then /^I should be informed about the cookies policy$/ do
  page.has_selector?('.eprivacy-banner__text')
  click_on("OK")
end

And /^I should see an info description regarding the page$/ do
  page.has_selector?('._21ezx')
  find_button(class: 'WHIom _3Uv7s').click
end

Then /^I should see most recently reviewed TVs$/ do
  raise "Expected to see item sorted as 'Most-recently viewed'" unless page.has_select?('Sort by', selected: 'Most-recently reviewed')
end

Given(/^I want to see the most affordable TVs first$/) do
  @sort_by = :low_to_high
end

When(/^I select the option from the 'Sort by' menu$/) do
  case @sort_by
  when :low_to_high
    select('Price (low to high)', from: 'Sort by')
  end
end

Then(/^I should see the TVs with the lowest price first$/) do
  get_prices = []
  page.all(:css, 'p._3iJwn').each {|p| get_prices << p.text[1..-1].to_i}

  sorted = get_prices.sort

  raise "Prices are not organized from low to high" unless get_prices.eql?(sorted)
end

Given(/^I want to see the most expensive TVs first$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the TVs with the highest price first$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I want to buy a small TV$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the TVs with small screen size first$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I want to see what has been recently released$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the latest releases first$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
