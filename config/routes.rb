Rails.application.routes.draw do
  get 'welcome/index'

  resources :categories do
    resources :entries#, only: [:new, :create]
  end
  resources :example_categories, controller: 'categories', type: 'ExampleCategory' do
    resources :entries
  end
  resources :getting_started_categories, controller: 'categories', type: 'GettingStartedCategory' do
    resources :entries
  end

	root 'welcome#index'
	resources :entries#, except: [:new, :create]
	devise_for :users, skip: [:registrations]

  get 'getting_started' => 'categories#getting_started', as: 'getting_started'
  get 'examples' => 'categories#examples', as: 'examples'

	# get 'entries/:id/data/:name' => 'entries#data'
end
