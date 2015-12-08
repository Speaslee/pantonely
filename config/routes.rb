require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount Sidekiq::Web => "/sidekiq"
  get "/songs/show" => 'songs#show'
  post "/songs/show" => 'songs#load'
  patch "/songs/show?:movie&:tag_list"=> 'songs#movie_update'
  resources :tags, only:[:index, :show]
  get "/users/profile/:id" => 'users#profile'
get "/users/show" => 'users#show'
root "songs#index"
end
