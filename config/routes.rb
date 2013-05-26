KnifeWebTest::Application.routes.draw do
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    passwords: "users/passwords",
    sessions: 'sessions'
  }

  resources :users
  resources :knife_configs
  resources :servers
match '/sync' => 'application#sync', :via => :get
  root :to => 'application#index'
end
