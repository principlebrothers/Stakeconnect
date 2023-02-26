Rails.application.routes.draw do
  resources :teacher_courses
  resources :reports
  resources :results
  resources :homeworks
  resources :courses
  resources :grades
  resources :events
  resources :attendances
  resources :students
  resources :administrators
  resources :parents
  resources :teachers
  resources :users
end
