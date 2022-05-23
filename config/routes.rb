Rails.application.routes.draw do
  get 'items/index'
  get 'messages/index'
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
