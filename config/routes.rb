Testify::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :exams do
    collection { post :sort }
  end


  root to: "users#new"
end
