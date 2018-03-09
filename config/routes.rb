Rails.application.routes.draw do
  root to: 'home#index'
  get '/about',   to: 'home#index'
  get '/caution', to: 'home#index'
  
  namespace :api, format: 'json' do
      resources :wordtasks, only: [:index, :create, :update]
  end
end
