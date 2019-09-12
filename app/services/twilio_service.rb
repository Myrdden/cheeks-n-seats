require("bundler")
Bundler.require()
require 'twilio-ruby'
class TwilioService

  def send_message(phone_number, message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    if !account_sid
      puts "You don't have the account_sid set: TWILIO_ACCOUNT_SID"
      return
    end
    if !auth_token
      puts "You don't have the auth_token set: TWILIO_AUTH_TOKEN"
      return
    end

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      to: phone_number,
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: message
    )
  end
end
