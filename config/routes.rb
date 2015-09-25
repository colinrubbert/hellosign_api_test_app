Rails.application.routes.draw do
  resources :signatures, only: [:new, :create] do
    collection do
      post 'callbacks'
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :topics

  root 'topics#index'

end
