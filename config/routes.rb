Testify::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :exams

  root to: "sessions#new"
end
