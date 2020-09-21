Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :question_accesses, only: [:create]
      resources :questions, only: [:index, :create]
      resources :disciplines, only: [:index]
    end
  end
end
