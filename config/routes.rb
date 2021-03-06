Rails.application.routes.draw do

  resources :tasks, :users, :projects

  root to: "welcome#home"

  get 'about' => "pages#about"

  get 'terms' => "pages#terms"

  get 'home' => "welcome#home"

  get 'faqs' => "pages#faqs"

  get 'tasks' => "tasks#index"

  get 'users' => "users#index"

  get 'projects' => "projects#index"

  get '/signup' => "registrations#new", as: :signup

  post '/signup' => "registrations#create"

  get '/signin' => "authentication#new", as: :signin

  post '/signin' => "authentication#create"

  get '/signout' => "authentication#destroy", as: :signout

end
