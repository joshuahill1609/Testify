Testify::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :exams do
    member do
      get 'answer_key'
    end
  end


  root to: "users#new"
end
