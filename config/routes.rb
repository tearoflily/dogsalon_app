Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'auth/create'
    end
  end
  root 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :bookings, only: [:index, :show]
      get 'bookings/index'
    end
  end

  get '/employees/bookings/', to: 'home#index'
  get '/employees/bookings/:id', to: 'home#index'


  # namespace :api, format: 'json' do
  #   namespace :v1 do
  #     resources :memos, only: [:index, :create]
  #   end
  # end
end
