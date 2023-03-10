Rails.application.routes.draw do
  devise_for :users
 
  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :create, :index, :show, :destroy ] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  # get 'pages/blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
