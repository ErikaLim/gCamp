Rails.application.routes.draw do

  root to: "welcome#home"

  get 'about' => "pages#about"

  get 'terms' => "pages#terms"

  get 'home' => "welcome#home"

  get 'faqs' => "pages#faqs"
end
