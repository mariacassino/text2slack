class HomeController < ApplicationController


  def channels_query
    @user = current_user
    if @user
       @token = @user.slack_token
       request = HTTParty.get("https://slack.com/api/channels.list",
       headers: { "Authorization" => @token,
                "User-Agent" => "Maria"},
       query:   {token: @token})
     end
   end


    def show
      @user = current_user
      if @user
        all_channels = channels_query["channels"]
        @channel_list = all_channels.map{|x| x["name"]}
      end
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
