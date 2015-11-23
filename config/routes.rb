require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => "/sidekiq"

root "songs#index"
end
