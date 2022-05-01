Rails.application.routes.draw do
  resources :recommendations
  resources :graders

  resources :courses do
    resources :sections
  end
  resources :pages do 
    member { patch :toggle_reviewed }
  end

  post 'courses/reload_courses'
  
  # Using devise for the users model
  devise_for :users


  # Routing to grader application form
  get '/graders', to: 'graders#index'
  
  root 'pages#home'
end
