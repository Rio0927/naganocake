Rails.application.routes.draw do
  root to: 'public/homes#top'
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'homes/top'
    
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
    
    get 'genres/index'
    post 'genres/create'
    get 'genres/edit'
    patch 'genres/update'
    
    get 'items/index'
    get 'items/new'
    post 'items/create'
    get 'items/show'
    get 'items/edit'
    patch 'items/update'
    
    patch 'order_details/update'
    
    get 'orders/show'
    get 'orders/index'
    patch 'orders/update'
  end

  namespace :public do
    get 'homes/about'
    
    get 'orders/new'
    post 'orders/confirm'
    get 'orders/thanks'
    post 'orders/create'
    get 'orders/index'
    get 'orders/show'
    
    resources :items, only: [:index, :show]
    
    get 'cart_items/index'
    patch '/cart_items/:id' => 'cart_items#update', as: 'cart_item_update' 
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'cart_item_destroy'
    post 'cart_items/create'
    
    get 'addresses/index'
    get 'addresses/edit'
    post 'addresses/create'
    patch 'addresses/update'
    delete 'addresses/destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
