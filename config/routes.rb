Rails.application.routes.draw do
  root 'offers#index'
  devise_for :users
  resources :users, :except => [:edit]
  resources :measures
  resources :locations
  resources :products
  resources :offers do 
  	get :reset_filterrific, on: :collection
  end
  post "offers/create_offer_user", to: "offers#create_offer_user", as: "create_offer_user"
  post "offers/change_status" => "offers#change_status"
end
