Rails.application.routes.draw do
  
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  # get 'users/update'
  root "welcome#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  # get 'posts/new'
  resources :posts
  resources :welcome, :only => [:index]
  resources :users, :only => [:show, :index, :edit, :update]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index, :edit, :update, :destroy]
  # resources :likes, :only => [:create, :destroy]
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
