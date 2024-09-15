Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'localizacoes/index'
    get 'localizacoes/show/:id', to: 'localizacoes#show'    
    get 'localizacoes/edit/:id', to: 'localizacoes#edit'    
    get 'localizacoes/new', to: 'localizacoes#new'    
    get 'produtos/index'
    get 'welcome/index'
    get 'welcome/show/:id', to: 'welcome#show'    
  end
  devise_for :admins
  get 'welcome/index'
  get 'home', to: 'site/welcome#index'
  get 'inicio', to: 'site/welcome#index'
  
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
