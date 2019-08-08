Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :projects do
    resources :employees
  end
  
  resources :divisions do
    resources :employees
  end
end
