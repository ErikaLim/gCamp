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
  
end
