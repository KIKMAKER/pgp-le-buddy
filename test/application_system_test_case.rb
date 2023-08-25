require "test_helper"

if ENV['TEST_SETUP'] == "mac"
  # here to test which route you are on will remove once this works on both setups
  p "<<<<<<<<<<<<<<<<<<<<<<< mac >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  #Mac test setup
  class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end

elsif ENV['TEST_SETUP'] == "wsl"
  # same as above
  p "<<<<<<<<<<<<<<<<<<<<<<< wsl2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  # wsl2 test setup using remote selenium
  # chromedriver binary file saved on root of local drive
  # run "/mnt/d/chromedriver --allowed-ips"(where "d" is the drive name the chromedriver was placed) in terminal to start selnium server
  # wsl2 needs line 14 & 15 to find the cromedriver server wsl1 does not
  WINDOWS_HOST = `cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'`.strip
  CHROMEDRIVER_URL = "http://#{WINDOWS_HOST}:9515/"

  class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
    driven_by :selenium_remote_chrome
    # remote selenium config
    Capybara.register_driver :selenium_remote_chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--start-maximized')

      Capybara::Selenium::Driver.new(
        app,
        browser: :remote,
        url: CHROMEDRIVER_URL,
        options: options
      )
    end

    Capybara.configure do |config|
      # Match what's set for URL options in test.rb so we
      # can test mailers that contain links.
      config.server_host = 'localhost'
      config.server_port = '3000'
    end
  end
end
