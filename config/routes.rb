Rails.application.routes.draw do
  resources :simulation_steps
  resources :simulations
  resources :alerts
  resources :time_flow_monitors
  resources :report_items
  resources :reports
  resources :event_stream_fields
  resources :event_streams
  resources :projects
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
