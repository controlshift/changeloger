Rails.application.routes.draw do
  root to: "changelogs#index"

  devise_for :users
  resources :changelogs do
    collection do
      post :publish
      get :feed
      get :feed_months
    end

    member do
      post :promote
    end
  end
  resources :users
  resources :pull_requests, only: [:index]
  resources :mailings
end
