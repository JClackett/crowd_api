Rails.application.routes.draw do


	resources :events
	resources :users, only: [:create, :index]


end