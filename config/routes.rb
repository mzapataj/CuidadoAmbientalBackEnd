Rails.application.routes.draw do

  #get 'score/index'
  #get 'score/show'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :destroy, :update, :login] do
        resources :users_scores, only: [:index, :create, :show, :destroy], path: :scores
        resources :users_water_scores, path: :water_score
      end
      resources :guests, only: [:index, :create, :destroy]
      resources :sessions, only: [:new, :create, :destroy]
      resources :scores, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'profile', action: :show, controller: 'users'
  #get 'profile', to: 'users#show'
  #get 'photos(/:id)', to: 'photos#display'
  #get 'photos/:id/:user_id', to: 'photos#show'
  
  #If you want to route /articles (without the prefix /admin)
  #to Admin::ArticlesController, you could use:
  #scope module: 'admin' do
  #  resources :articles, :comments
  #end
  #Or
  #resources :articles, module: 'admin'
  
  #If you want to route /admin/articles to ArticlesController 
  #(without the Admin:: module prefix), you could use:
  #scope '/admin' do
  #  resources :articles, :comments
  #end
  #Or
  #resources :articles, path: '/admin/articles'
  
  #If you need to use a different controller namespace 
  #inside a namespace block you can specify an absolute
  #controller path, e.g: get '/foo', to: '/foo#index'.

  #default parameter
  #  defaults format: :json do
  #    resources :photos
  #  end

  #get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }
end
