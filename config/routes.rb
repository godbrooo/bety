Rails.application.routes.draw do
  devise_for :users, controllers: {invitations: "invitations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, only: [ :new, :create, :show, :index, :update]

  resources :bets, only: [:show, :index]


  get 'pages/privacy', to: 'pages#privacy', as: :privacy
  # get 'bets#profile', to: 'bets#participate', as: :betsencours

  patch 'bets/:id/participate', to: 'bets#participate', as: :participate
  patch 'bets/:id/deny', to: 'bets#denied' , as: :denied
  patch 'bets/:id/close_bets', to: 'bets#close_bets' , as: :close_bets

  patch 'bet/show/ongoing',to: 'games#ongoing', as: :game_ongoing
  patch 'bet/show/closed',to: 'games#closed', as: :game_closed



  get 'games/:id/invite', to: 'games#invite', as: :invite
  post 'games/:id/invite', to: 'games#save_invite'

  get 'games/:id/winners', to: 'games#winners', as: :winners
  patch 'games/:id/winners', to: 'games#close'

  get 'games/:id/resume_', to: 'games#resume_challenge', as: :resume

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


end
