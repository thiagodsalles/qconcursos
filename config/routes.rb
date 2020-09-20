Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :question_accesses
      resources :questions
      resources :disciplines
      resources :file_uploads
    end
  end
end
