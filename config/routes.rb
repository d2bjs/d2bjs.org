Rails.application.routes.draw do
	root 'entries#index'
	resources :entries
	devise_for :users, skip: [:registrations]

	get 'data_form/:number' => 'entries#data_form'
	get 'entries/data/:name' => 'entries#data'
end
