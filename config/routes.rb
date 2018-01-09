Rails.application.routes.draw do
  devise_for :users
  get '/about', to: 'pages#about'

  resources :posts do 
  	resources :comments
  end


  root to: "posts#index"
end
