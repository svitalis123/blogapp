Rails.application.routes.draw do
  resources :users do
    resources :posts, only: [:show, :index]
  end
  # get 'pages/blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
