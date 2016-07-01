require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header
  skip_before_action :verify_authenticity_token

    def sms
    	response = Twilio::TwiML::Response.new do |r|
    	  r.Message 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :sms => 'alice'
      
    	end

    	render_twiml response
    end


end
