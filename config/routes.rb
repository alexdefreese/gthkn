Gthkn::Application.routes.draw do

  devise_for :users

  resources :users
  resources :blogposts, :only => [:create, :edit, :update, :destroy, :index]
  resources :events
  resources :initiation_requirements, only: [:new, :create, :update]
  resources :auth_codes
  
  match '/admin/user_admin' => 'users#user_admin', :as => :user_admin
  match '/admin/user_admin/search' => 'users#user_admin_search', :as => :user_admin_search
  match '/admin/initiation' => 'initiation#index', as: :initiation
  
  match '/:controller(/:action(/:id))'
  
  match '/signup' => 'users#new', :as => :signup
  
  match '/new_blogpost' => 'blogposts#new', :as => :new_blogpost
  
  root :to => 'pages#home'
  match '/about' => 'pages#about', :as => :about
  match '/eventlist' => 'pages#events', :as => :eventlist
  match '/corporate' => 'pages#corporate', :as => :corporate
  match '/officers' => 'pages#officers', :as => :officers
  match '/contact' => 'pages#contact', :as => :contact
  match '/blog' => 'blogposts#index', :as => :blog
  
  match '/admin' => 'pages#admin', :as => :admin
end
