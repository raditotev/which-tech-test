# Automation test for the TV review section at Which website

### Setup

1. Install rvm
  Follow the instructions [here](https://rvm.io/rvm/install)
2. Install ruby
  `rvm install ruby-2.4.0`
3. Install bundler
  `gem install bundler`
4. Clone this repository
  `git clone git@github.com:raditotev/which-tech-test.git`
5. Go to which-tech-test folder
6. Run `bundle install`
7. Install chromedriver
  *On Mac OSX*
  Download binary from [here](https://sites.google.com/a/chromium.org/chromedriver/downloads)
  Unzip and place file in `/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome`
  *On Linux*
  Follow instructions [here](https://developers.supportbee.com/blog/setting-up-cucumber-to-run-with-Chrome-on-Linux/)

### Running tests

Execute `cucumber`