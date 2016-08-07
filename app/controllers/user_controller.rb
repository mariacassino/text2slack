class UserController < ApplicationController

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


    def profile
      if @user
        all_channels = channels_query["channels"]
        @channel_list = all_channels.map{|x| x["name"]}
      end
    end


end
