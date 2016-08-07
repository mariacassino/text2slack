Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  get 'user/profile' => 'user#profile'

  resources :home

  get 'home/goodbye' => 'home#goodbye'
  get 'home/form' => 'home#form'
  post 'twilio/sms' => 'twilio#sms'


end
