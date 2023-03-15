Rails.application.routes.draw do
  default_url_options  :protocol=> "https", :host => "stakeconnect-development.up.railway.app"
  
  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }

  devise_for :parents, controllers: {
    sessions: 'parents/sessions',
    registrations: 'parents/registrations'
  }

  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions',
    registrations: 'administrators/registrations'
  }

  resources :course_reports
  resources :teacher_courses
  resources :reports
  resources :results
  resources :homeworks
  resources :courses
  resources :grades
  resources :events
  resources :attendances
  resources :students
  resources :teachers
  resources :parents
  resources :administrators
end
