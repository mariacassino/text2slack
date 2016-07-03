class CallbacksController < Devise::OmniauthCallbacksController

    def slack
      request.env["omniauth.auth"]
      @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        redirect_to "/", notice: "Signed in with Slack"
      end

end
