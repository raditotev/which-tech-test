Given /^I am on the TV sets review page$/ do
  visit("http://www.which.co.uk/reviews/televisions?sortby=testing_date_desc&page=1")
end

Then /^I should be informed about the cookies policy$/ do
  raise "Cookies info message not present" unless page.has_selector?('.eprivacy-banner__text')
  click_on("OK")
end

And /^I should see an info description regarding the page$/ do
  raise "Info description banner missing" unless page.has_selector?('._21ezx')
  find_button(class: 'WHIom _3Uv7s').click
end

Then /^I should see most recently reviewed TVs$/ do
  raise "Expected to see 'Most-recently viewed' as current in drop down menu" unless page.has_select?('Sort by', selected: 'Most-recently reviewed')

  find(:css, 'a._1FbxT', match: :first)
  recently_reviewed = []

  page.all(:css, 'p._32MSL').each_with_index do |d, i|
    if i.odd?
      date = d.text.gsub(/Reviewed:\s(-)?/, '').strip
      recently_reviewed << Date.parse(date) unless date.empty?
    end
  end

  most_recently_reviewed = recently_reviewed.sort.reverse

  raise "Expected to see latests reviewed first" unless most_recently_reviewed.eql?(recently_reviewed)
end

Given(/^I want to see the most affordable TVs first$/) do
  @sort_by = :low_to_high
end

When(/^I select the option from the 'Sort by' menu$/) do
  case @sort_by
  when :low_to_high
    select('Price (low to high)', from: 'Sort by')
  when :high_to_low
    select('Price (high to low)', from: 'Sort by')
  when :screen_size
    select('Screen size (high to low)', from: 'Sort by')
  when :recently_launched
    select('Most-recently launched', from: 'Sort by')
  end
end

Then(/^I should see the TVs with the lowest price first$/) do
  find(:css, 'a._1FbxT', match: :first)
  get_prices = []
  page.all(:css, 'p._3iJwn').each {|p| get_prices << p.text.gsub(/(£|\,|\s|\.)/, '').to_i}

  cheap_first = get_prices.sort

  raise "Items are not organized from low to high price" unless get_prices.eql?(cheap_first)
end

Given(/^I want to see the most expensive TVs first$/) do
  @sort_by = :high_to_low
end

Then(/^I should see the TVs with the highest price first$/) do
  find(:css, 'a._1FbxT', match: :first)
  get_prices = []

  page.all(:css, 'p._3iJwn').each {|p| get_prices << p.text.gsub(/(£|\,|\s|\.)/, '').to_i}

  expensive_first = get_prices.sort.reverse
  raise "Items are not organized from high to low price" unless get_prices.eql?(expensive_first)
end

Given(/^I want to buy a large TV$/) do
  @sort_by = :screen_size
end

Then(/^I should see the TVs with large screen size first$/) do
  find(:css, 'a._1FbxT', match: :first)
  sorted_by_screen = []

  page.all(:css, 'div._1ULbH').each {|p| sorted_by_screen << p.text.chomp('"').to_i}

  large_first = sorted_by_screen.sort.reverse
  raise "Large screens should come first" unless sorted_by_screen.eql?(large_first)
end

Given(/^I want to see what has been recently released$/) do
  @sort_by = :recently_launched
end

Then(/^I should see the latest releases first$/) do
  find(:css, 'a._1FbxT', match: :first)
  recently_launched = []

  page.all(:css, 'p._32MSL').each_with_index do |d, i|
    if i.even?
      date = d.text.gsub(/Launched:\s/, '')
      recently_launched << Date.parse(date)
    end
  end

  most_recent = recently_launched.sort.reverse

  raise "Expected to see latests launches first" unless most_recent.eql?(recently_launched)
end
