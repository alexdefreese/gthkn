Gthkn::Application.routes.draw do
  get "event/new"

  get "event/show"

  get "event/index"

  get "event/edit"

  get "event/update"

  get "event/delete"

  devise_for :users

  resources :users
  resources :blogposts, :only => [:create, :edit, :update, :destroy, :index]
  
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
  match '/blog' => 'blogposts#index', :as => :blog
  
  match '/admin' => 'pages#admin', :as => :admin
end
