Rails.application.routes.draw do

  namespace :admin do
    get 'notifications/index'
  end

  get 'notifications/index'

  namespace :admin do
    get 'posts/index'
  end

  namespace :admin do
    get 'posts/new'
  end

  namespace :admin do
    get 'posts/edit'
  end

  get 'news/prays'

  get 'news/events'

  get 'news/shelf'

  get 'news/ministries'

  get 'news/testimonies'

  resources :subscribers

  root 'posts#index'
  resources :posts do
    resources :comments
  end

  get 'static/about', to: 'static#about', as: :about
  get 'static/terms', to: 'static#terms', as: :terms
  get 'search_results', to: 'posts#search_results', as: :search_results  #for results of search from search form in header
  resources :contacts, only: [:new, :create] #for contact me functionality
  resources :intentions, only: [:new, :create, :index]
  get 'count', to: 'prayers#count', as: :count

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
