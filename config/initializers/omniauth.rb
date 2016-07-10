Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :slack, ENV["SLACK_APP_ID"], ENV['SLACK_APP_SECRET"], scope: "client"
end
