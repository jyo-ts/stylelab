Rails.application.routes.draw do
  
  root "welcome#index"
  devise_for :users
  get 'posts/new'
  resources :posts
  resources :welcome, :only => [:index]

end
