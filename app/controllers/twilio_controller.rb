require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header
  skip_before_action :verify_authenticity_token


  def sms
    @user = User.find_by(phone: "#{params[:From]}")
    @token = @user.slack_token
    @channel = @user.channel
    request = HTTParty.post("https://slack.com/api/chat.postMessage",
      headers: { "Authorization" => @token,
                  "User-Agent" => "Maria"
                },
      query:   {token: @token,
                channel: @channel,
                text: "#{params[:Body]}",
                as_user: true,
                })
  end

end
