Rails.application.routes.draw do



#顧客用
#URL  /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

    scope module: :public do
      root to: "homes#top"
      get 'about' => 'homes#about'
      resources :items, only: [:index, :show]
      resources :customers, only: [:show, :edit, :update]
    end







#管理者側
#URL  /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

    namespace :admin do
      get '/' => 'homes#top'
      post 'items' => 'items#create'
      patch 'items/:id' => 'items#update',as: 'edit_item'
      resources :items, only: [:new, :index, :show, :edit]
      resources :customers, only: [:index, :show, :edit, :update]
    end




end
