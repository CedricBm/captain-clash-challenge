Rails.application.routes.draw do
  root "captain_clash#index"

  resources :heros
  resources :fights, except: :new
  get "fights/new/:rank", to: "fights#new", as: :new_fight
end
