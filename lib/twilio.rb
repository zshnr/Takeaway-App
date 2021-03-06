require 'twilio-ruby'
require 'dotenv'

module Twilio
  def send_message(body)
    setup_twilio
    @client.account.messages.create(
      to: ENV['CUST_NUM'],
      from: ENV['TWILIO_NUM'],
      body: body
    )
    'Message Sent Successfully'
  end

  def load_env_vars(environment)
    if environment == 'production'
      Dotenv.load('./.env')
    else
      Dotenv.load('./.env.testing')
    end
  end

  private

  def setup_twilio
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
