# config/routes.rb
Rails.application.routes.draw do
  # Other routes...

  get "students/:id/dashboard", to: "students#dashboard", as: "student_dashboard"

  # Login and logout routes
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  # Sign-up routes
  get "signup", to: "users#new", as: :signup
  post "signup", to: "users#create"

  # Root path points to the welcome page (Home page for non-logged-in users)
  root "pages#welcome"

  # Redirect dashboard/index to dashboard for cleaner URL
  get "dashboard/index", to: redirect("/dashboard")

  # Merit Dimerit routes
  get "merit", to: "merit#index", as: :merit

  # Canteen path (in home page to canteen module) aka canteen_path
  get "canteen_path", to: "canteen#index", as: :canteen

  get "examples", to: "examples#index"

  get "home", to: "home#index"

  # Student routes
  resources :students, only: [ :show ] do
    collection do
      get "search"
    end
  end
end
