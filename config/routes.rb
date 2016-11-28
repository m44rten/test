Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'
  
  resources :articles
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  get 'about', to: 'page#about'
  get 'page/homepage', to: 'page#homepage'
  root 'page#homepage'
end
