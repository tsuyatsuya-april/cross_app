Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cross_answers#index' 
  resources :students, only: [:index, :new, :create]
  resources :lessons, only: [:index, :new, :create]
  resources :cross_answers, only: [:index, :create, :update, :destroy]
  resources :members, only: [:new, :create]
  resources :battings do
    collection do
      get 'search'
    end
  end
  
end
