Gthkn::Application.routes.draw do
  devise_for :users

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :blogposts, :only => [:create, :edit, :update, :destroy]
  
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  
  match '/admin/user_admin' => 'users#user_admin', :as => :user_admin
  match '/admin/user_admin/search' => 'users#user_admin_search', :as => :user_admin_search
  
  match '/:controller(/:action(/:id))'
  
  match '/signup' => 'users#new', :as => :signup
  
  match '/new_blogpost' => 'blogposts#new', :as => :new_blogpost
  
  root :to => 'pages#home'
  match '/about' => 'pages#about', :as => :about
  match '/events' => 'pages#events', :as => :events
  match '/corporate' => 'pages#corporate', :as => :corporate
  match '/officers' => 'pages#officers', :as => :officers
  match '/contact' => 'pages#contact', :as => :contact
  
  match '/admin' => 'pages#admin', :as => :admin
end
