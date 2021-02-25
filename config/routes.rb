Rails.application.routes.draw do
  root to: "changelogs#index"

  devise_for :users
  resources :changelogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
