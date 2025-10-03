Rails.application.routes.draw do
  get 'relationship/show'
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get "search" => "searches#search"

  
  root :to =>"homes#top"  
  get "home/about"=>"homes#about"
  devise_for :users
  

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :followings
      get :followers
    end
    resource :relationship, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

