Rails.application.routes.draw do
  get 'tags/:tag', to: 'questions#index', as: :tag, :constraints  => { :tag => /[^\/]+/ }

  root 'questions#index'
  devise_for :users

  
  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :users, :only => :show, as: :user_profile
  resources :users, :only => :edit, as: :profile
  resources :users, :only => :update

  resources :questions do 
    resources :answers
  end
end
