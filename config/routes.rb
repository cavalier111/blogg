Rails.application.routes.draw do

 
  resources :image_uploads
  resources :your_scaffolds
  get 'welcome/index'
  resources :articles do
    resources :comments
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
	end
  root 'welcome#index'
  
  get '/signup'  => 'users#new' 
  post '/users' => 'users#create'
  resources :users

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
