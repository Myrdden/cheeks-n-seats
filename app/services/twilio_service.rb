require("bundler")
Bundler.require()

class TwilioService

  def initalize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(user, message)
    client.messages.create({
      to: "+13098387173",
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "Robot invasion: Report any sightings"
    })
  end
end
