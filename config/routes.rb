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
    end







#管理者側
#URL  /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }






end
