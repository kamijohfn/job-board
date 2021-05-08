Rails.application.routes.draw do
  devise_for :users
  #get 'jobs/index'
  root to: "jobs#index"
  resources :jobs, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
