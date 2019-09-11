Twilio.configure do |config|
  config.account_sid = Rails.application.twilio_account_sid
  config.auth_token = Rails.application.twilio_auth_token
end
