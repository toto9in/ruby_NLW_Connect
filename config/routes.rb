Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "event", to: "events#create"
  post "subscriber", to: "subscribers#create"
  get "subscriber/link/:link/event/:event_id", to: "subscribers#subscribers_by_link"
  get "subscriber/ranking/event/:event_id", to: "subscribers#link_ranking"
  post "events_link", to: "events_link#create"

  # Defines the root path route ("/")
  # root "posts#index"
end
