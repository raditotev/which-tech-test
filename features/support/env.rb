require 'capybara/cucumber'
# Use binding.pry in step definitions for debugging (REPL)
require 'pry'

Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
  options = {
  :js_errors => false,
  :timeout => 360,
  :debug => false,
  :inspector => false,
  }
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

height = ENV['height']
width = ENV['width']

if height && width
  Capybara.current_session.driver.browser.manage.window.resize_to(height, width)
end
