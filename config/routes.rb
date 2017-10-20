Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users

  
  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :questions
end
