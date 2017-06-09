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
