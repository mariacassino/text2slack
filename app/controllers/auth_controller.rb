class AuthController < ApplicationController

  def twilio
      data = request.env["omniauth.auth"]

      user = User.where(twilio_id: data.uid).first_or_create! do |u|
        u.email       = data.info.email
        u.password    = SecureRandom.hex 64
        u.twilio_data = data.to_h.to_json
      end

      sign_in user
      redirect_to "/", notice: "Signed in with Twilio"
    end

end
