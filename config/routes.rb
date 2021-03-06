# == Route Map (Updated 2014-10-20 22:02)
#
#         Prefix Verb   URI Pattern                    Controller#Action
#     promotions GET    /promotions(.:format)          promotions#index
#                POST   /promotions(.:format)          promotions#create
#  new_promotion GET    /promotions/new(.:format)      promotions#new
# edit_promotion GET    /promotions/:id/edit(.:format) promotions#edit
#      promotion GET    /promotions/:id(.:format)      promotions#show
#                PATCH  /promotions/:id(.:format)      promotions#update
#                PUT    /promotions/:id(.:format)      promotions#update
#                DELETE /promotions/:id(.:format)      promotions#destroy
#       students GET    /students(.:format)            students#index
#                POST   /students(.:format)            students#create
#    new_student GET    /students/new(.:format)        students#new
#   edit_student GET    /students/:id/edit(.:format)   students#edit
#        student GET    /students/:id(.:format)        students#show
#                PATCH  /students/:id(.:format)        students#update
#                PUT    /students/:id(.:format)        students#update
#                DELETE /students/:id(.:format)        students#destroy
#           root GET    /                              promotions#index
#

Learn::Application.routes.draw do
  devise_for :students
  namespace :admin do
    resources :achievements, :events
    resources :achievement_notes, only: :update
    resources :courses do
      member do
        get :evaluations
      end
    end
    resources :students do
      post :sync_profile
    end
    resources :promotions do
      post :sync_courses
      member do
        get :evaluations
      end
    end
    root to: 'students#index'
  end
  resources :courses, only: :show do
    get :evaluate
    patch 'evaluate' => 'courses#update_evaluation'
    post 'evaluate' => 'courses#update_evaluation'
  end
  get 'me' => 'dashboard#me', as: :me
  patch 'me' => 'dashboard#update_me', as: :update_me
  get 'api/projects/:teach_project_id' => 'api/projects#show'
  get 'api/promotions/:year' => 'api/promotions#show'
  root 'dashboard#index'
end
