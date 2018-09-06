ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def log_in_as(user, password: 'password')
    post user_session_path "user[email]" => user.email, "user[password]" => password 
  end
  def card_token(number, cvc, exp_month, exp_year)
    Payjp::api_key = PAY_PUB_KEY
    token = Payjp::Token.create(
    card: {
      number: number,
      cvc:    cvc,
      exp_month: exp_month,
      exp_year: exp_year
    })
    return token.id
  end
end
