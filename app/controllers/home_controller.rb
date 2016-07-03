class HomeController < ApplicationController

def form 
  @user = current_user
end


def update
  @user = current_user
  if @user.update(phone: "+1#{params["user"]["phone"]}", channel: "#{params["user"]["channel"]}")
    flash[:success] = "Success! You may now send messages to your Slack channel via SMS"
    redirect_to "/"
  end
end




private

  def approved_params
    params.require(:user).permit(:phone)
  end


end
