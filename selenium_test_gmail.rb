require 'rubygems'
require 'selenium-webdriver'
require 'test-unit'

class GmailLoginTest < Test::Unit::TestCase

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@driver.get "http://www.gmail.com"
	end

	def test_page_title
		assert_equal @driver.title, "Gmail: Email from Google"
	end

	def test_login
		loginBox = @driver.find_element(:id, "Email")
		loginBox.send_keys("email.address1@gmail.com")
		pwBox = @driver.find_element(:id, "Passwd")
		pwBox.send_keys("!SuperSecretpassw0rd")
		signinBtn = @driver.find_element(:id, "signIn")
		signinBtn.click()
	end

	def teardown
		@driver.quit
	end
end
