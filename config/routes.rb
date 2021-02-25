Rails.application.routes.draw do
  root to: "changelogs#index"

  devise_for :users
  resources :changelogs do
    collection do
      post :publish
    end
  end
  resources :pull_requests
  resources :mailings
end
