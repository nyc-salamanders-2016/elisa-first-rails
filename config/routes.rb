Rails.application.routes.draw do
	get '/' => 'index#index'
	get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'

  resources :posts
  # get '/posts' => 'posts#index'
  # get '/posts/:id' => 'posts#show'
  # get '/posts/new' => 'posts#create'
end
