Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :projects
  resources :divisions do
    resources :employees
  end
end
