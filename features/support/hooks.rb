require 'fileutils'

Before do |scenario|
  $this_is_scenario_one = defined?($this_is_scenario_one) ? false : true

  # Remove screenshots from ./screenshots folder before running new round of tests
  FileUtils.rm_rf(File.join(FileUtils.pwd, "/screenshots/."), secure: true) if $this_is_scenario_one
end

After do |scenario|
  if(scenario.failed?) # Create screenshot on failure
    screenshots_dir = File.join(FileUtils.pwd, "/screenshots")
    FileUtils.mkdir(screenshots_dir) unless File.directory?(screenshots_dir)
    name_of_scenario = scenario.name.gsub(/\s+/, "_").gsub("/","_")
    page.save_screenshot(screenshots_dir + "/#{name_of_scenario}.png")
    puts "Name of snapshot is #{name_of_scenario}"
    puts "Snapshot is taken"
    puts "#===========================================================#"
    puts "Scenario: #{scenario.name}"
    puts "#===========================================================#"
  end
end
