Mystudents::Application.routes.draw do
  resources :promotions
  resources :students
  root 'promotions#index'
end
