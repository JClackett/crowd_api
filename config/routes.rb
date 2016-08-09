Rails.application.routes.draw do


	resources :events, only: [:create, :index, :update, :destroy, :show]
	resources :guests, only: [:create, :index, :destroy]
	resources :users, only: [:create, :index]


end