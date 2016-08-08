require 'rails_helper'

describe TwilioController do


  it "disallows users from texting without valid Slack token" do
    user = create :user
    sign_in user

    response = HTTParty.post("https://slack.com/api/chat.postMessage",
      headers: { "Authorization" => user.slack_token,
                  "User-Agent" => "Maria"
                },
      query:   {token: user.slack_token,
                channel: user.channel,
                text: "tokenless message",
                as_user: true
                })
        expect(response["error"]).to eq "invalid_auth"
  end


end
