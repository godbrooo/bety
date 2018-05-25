Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, only: [ :new, :create, :show, :index ]

  resources :bets, only: [:show, :index]
  patch 'bets/:id/', to: 'bets#participate', as: :participate
  patch 'bets/:id/', to: 'bets#denied' , as: :denied


  get 'games/:id/invite', to: 'games#invite', as: :invite
  post 'games/:id/invite', to: 'games#save_invite'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


end
