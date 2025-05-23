Rails.application.routes.draw do
  devise_for :users
  resources :online_peer_and_recovery_resources
  resources :in_person_interest_resources
  resources :in_person_wellbeing_resources
  resources :in_person_recovery_resources
  get "home/index"
  resources :community_resources
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  get '/print_resource_sheet', to: "home#print"
  get '/tagged', to: "in_person_recovery_resources#tagged"
  get '/wellbeing_tagged', to: "in_person_wellbeing_resources#tagged"
  get '/interest_tagged', to: "in_person_interest_resources#tagged"
  get '/peer_tagged', to: "online_peer_and_recovery_resources#tagged"

  root :to => "home#index"

  # root :to => "in_person_recovery_resources#index"
end
