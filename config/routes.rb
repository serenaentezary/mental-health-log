Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  namespace :api do
    namespace :v1 do
      resources :users, param: :id, only: [:index, :show] do
        resources :user_emotions
        resources :journals
        resources :goals
      end
      scope :user do
        get 'is_signed_in', to: 'user#is_signed_in?'
      end
    end
  end
end
