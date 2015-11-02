Rails.application.routes.draw do
  resources :categories

	root 'categories#recently_updated'
	resources :entries
	devise_for :users, skip: [:registrations]

	get 'recently_updated' => 'categories#recently_updated', as: 'recently_updated'
	get 'recently_created' => 'categories#recently_created', as: 'recently_created'
	get 'entries/:id/data/:name' => 'entries#data'
end
