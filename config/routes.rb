Rails.application.routes.draw do


	resources :events, only: [:create, :index, :update, :destroy, :show]
	resources :guests, only: [:create, :index]
	delete 'guests', :to => 'guests#destroy'
	resources :users, only: [:create, :index]


end