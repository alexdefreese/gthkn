Gthkn::Application.routes.draw do

  resources :wikipages do
    resources :wiki_revisions, only: [:new, :create, :index]
  end

  devise_for :users

  resources :users
  resources :blogposts, :only => [:create, :edit, :update, :destroy, :index]
  resources :events
  resources :initiation_requirements, only: [:new, :create, :update]
  resources :auth_codes

  match '/admin/user_admin' => 'users#user_admin', :as => :user_admin
  match '/admin/user_admin/search' => 'users#user_admin_search', :as => :user_admin_search
  match '/admin/initiation' => 'promotions#initiation', as: :initiation

  match '/promotion/member_request/:id' => 'promotions#request_member_promotion',
    as: :member_promote_request
  match '/promotion/member' => 'promotions#member_promote', as: :member_promote

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
