require 'java'
require 'rspec'
require 'capybara'
require 'rubygems'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require 'capybara-screenshot/cucumber'
require 'capybara/dsl'
#require 'rukuli'

host = YAML.load_file('config/environments.yml')[ENV['TARGET_ENV']]

#Rukuli::Config.run do |config|
#  config.image_path = "C:/Users/tester/Projects/sanity_test/features/support/images"
#  config.logging = false
#end

Before do
  #@screen = Rukuli::Screen.new
  #page.driver.browser.manage.window.maximize
end

After('@teacher_live_class') do
  stop_all_live_classes
end

After('@guest_signin') do
  page.driver.browser.close
end

Capybara.run_server       = false
Capybara.default_driver   = :selenium
Capybara.default_selector = :css
Capybara.app_host         = "http://#{host}"

Capybara.save_and_open_page_path = "screenshots"
Capybara.default_wait_time = 5

module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)
