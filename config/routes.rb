PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#register', as: :register
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:new, :show, :create]

  resources :users, only: [:create, :show, :edit, :update]
end
