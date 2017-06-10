# Which website - TV review section, automation test

### Setup

1. Install rvm
  + Follow the instructions [here](https://rvm.io/rvm/install)
2. Install ruby
  + `rvm install ruby-2.4.0`
3. Install bundler
  + `gem install bundler`
4. Clone this repository
  + `git clone git@github.com:raditotev/which-tech-test.git`
5. Go to which-tech-test folder
6. Run `bundle install`
7. Install chromedriver
  + __Mac OSX__
  + Download binary from [here](https://sites.google.com/a/chromium.org/chromedriver/downloads)
  + Unzip and place file in `/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome`
  + __Linux__
  + Follow instructions [here](https://developers.supportbee.com/blog/setting-up-cucumber-to-run-with-Chrome-on-Linux/)

### Running tests

Execute `cucumber` in order to run all tests

If you want to run scenario or group of scenarios, place @tag above each one and run `cucumber -t @tag`

To test feature on different browser sizes, pass the required dimensions from the command line e.g. `cucumber height=1920 width=1080`

### Results

In case of failing tests, the framework prints custom messages, describing the failure and creates a /screenshots folder in the project folder, where a screenshot with the scenario name can be found.
