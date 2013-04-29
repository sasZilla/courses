LoginApp::Application.routes.draw do
  get "courses/index",  :as => :courses
  get "courses/:id/add_to_user" => 'courses#add_to_user'
  get "courses/:id/add_to_wait_list" => 'courses#add_to_wait_list'

  resources :users, :user_sessions, :courses
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
end
