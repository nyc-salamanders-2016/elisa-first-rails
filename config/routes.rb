Rails.application.routes.draw do
	get '/' => 'index#index'
	get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'

  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#create'
end
