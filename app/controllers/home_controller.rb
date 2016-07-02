class HomeController < ApplicationController

def phone
  @user = current_user
end


def update
  @user = current_user
  if @user.update(phone: "+1#{params["user"]["phone"]}")
    flash[:success] = "phone number updated"
    redirect_to "/"
  end
end




private

  def approved_params
    params.require(:user).permit(:phone)
  end


end
