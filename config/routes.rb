KnifeWebTest::Application.routes.draw do
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    passwords: "users/passwords",
    sessions: 'sessions'
  }
  resources :servers
  resources :knife_configs
match '/sync' => 'application#sync', :via => :get
  root :to => 'application#index'
end
