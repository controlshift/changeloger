Rails.application.routes.draw do
  root to: "changelogs#index"

  devise_for :users
  resources :changelogs do
    collection do
      post :publish
      get :feed
      get :feed_months
    end
  end
  resources :users
  resources :pull_requests
  resources :mailings
end
