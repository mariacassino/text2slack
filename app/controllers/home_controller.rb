class HomeController < ApplicationController


  def user
    @user = current_user
  end

  def channels_query
    if @user
       @token = @user.slack_token
       request = HTTParty.get("https://slack.com/api/channels.list",
       headers: { "Authorization" => @token,
                "User-Agent" => "Maria"},
       query:   {token: @token})
     end
   end

    def show
      if @user
        all_channels = channels_query["channels"]
        @channel_list = all_channels.map{|x| x["name"]}
      end
    end

    def update
      if @user.update(approved_params)
        flash[:success] = "Success! You may now send messages to your Slack
          channel via SMS by texting (954) 280-1616"
        redirect_to "/home/form"
      else
        flash[:error]
      end
    end

    private

    def approved_params
      params.require(:user).permit(:phone)
    end


  end
