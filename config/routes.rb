Testify::Application.routes.draw do
  devise_for :users

  resources :users
  resources :exams do
    member do
      get 'answer_key'
    end
  end

  namespace :user do
    root to: "users#show"
  end
  
  root to: "users#new"
end
