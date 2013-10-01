Testify::Application.routes.draw do
  devise_for :users

  resources :users do
    member do
      get 'about'
    end
  end
  
  resources :exams do
    member do
      get 'answer_key'
      get 'new_version'
    end
  end

  namespace :user do
    root to: "users#show"
  end
  
  root to: "users#new"
end
