TagCloud::Application.routes.draw do
  root to: 'user_sessions#index'

  resources :tags, only: [:index, :new, :create]
  resources :mapped_values, only: [:new, :create]
end
