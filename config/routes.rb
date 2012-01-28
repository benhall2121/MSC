MSC::Application.routes.draw do
  resources :messages

  resources :contacts

  resources :projects

  resources :abouts

  root :to => "projects#index"
	
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "admin" => "users#admin", :as => "admin"
  
  get "get_more" => "projects#get_more", :as => "get_more"
	
  resources :users
  resources :sessions
  
end
