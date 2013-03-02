TagCloud::Application.routes.draw do
  root to: 'user_sessions#index'

  resources :tags, only: [:index, :new, :create]
end
