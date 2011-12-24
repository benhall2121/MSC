MSC::Application.routes.draw do
  resources :messages

  resources :contacts

  resources :projects

  resources :abouts

  root :to => "projects#index"
	
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
	
  resources :users
  resources :sessions
  
end
