Rails.application.routes.draw do
  resources :applicants, only: [:create, :update]
end
