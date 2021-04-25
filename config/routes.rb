Rails.application.routes.draw do
  root 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :bookings, only: [:index, :show, :new]
      get 'bookings/index'
      get 'auth/create'
    end
  end

  get '/employees/bookings/', to: 'home#index'
  get '/employees/bookings/:id', to: 'home#index'
  get '/employees/bookings/new/', to: 'home#index'


  # namespace :api, format: 'json' do
  #   namespace :v1 do
  #     resources :memos, only: [:index, :create]
  #   end
  # end
end
