require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount Sidekiq::Web => "/sidekiq"
  get "/songs/show" => 'songs#show'
  patch "/songs/show" => 'songs#load'
root "songs#index"
end
