Rails.application.routes.draw do
  root "captain_clash#index"

  resources :heros
end
