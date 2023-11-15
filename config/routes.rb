Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post 'search-by-id', to: 'bus#search_by_id'
  post 'search-by-location', to: 'bus#search_by_location'
  post 'login', to: 'bus#login'
  post 'register', to: 'bus#register'
  post 'more-info', to: 'bus#more_info'
  post 'more-info-driver', to: 'bus#more_info_driver'
  # Defines the root path route ("/")
  # root "posts#index"
end
