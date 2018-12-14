Rails.application.routes.draw do
  
  root "welcome#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  get 'posts/new'
  resources :posts
  resources :welcome, :only => [:index]

end
