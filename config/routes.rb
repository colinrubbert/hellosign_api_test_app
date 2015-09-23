Rails.application.routes.draw do
  post '/signatures/callbacks',
    to: 'signatures#callbacks'

  devise_for :users
  resources :topics
  
  root 'topics#index'

end
