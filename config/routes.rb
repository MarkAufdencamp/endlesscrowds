require 'sidekiq/web'

Endlesscrowds::Application.routes.draw do
  match '/thank_you' => "static#thank_you"
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  check_user_admin = lambda { |request| request.env["warden"].authenticate? and request.env['warden'].user.admin }

  # Mountable engines
  constraints check_user_admin do
    mount Sidekiq::Web => '/sidekiq'
  end

# Comment this out when running rake db:migrate for the first time
  mount CatarseWepay::Engine => "/", as: "catarse_wepay"

  # Non production routes
  if Rails.env.development?
    resources :emails, only: [ :index ]
  end


  # Static Pages
  get '/sitemap',               to: 'static#sitemap',             as: :sitemap
  get '/guidelines',            to: 'static#guidelines',          as: :guidelines
  get "/guidelines_tips",       to: "static#guidelines_tips",     as: :guidelines_tips
  get "/guidelines_backers",    to: "static#guidelines_backers",  as: :guidelines_backers
  get "/guidelines_start",      to: "static#guidelines_start",    as: :guidelines_start
  get "/referrals",             to: "static#referrals",           as: :referrals
  get "/foundation",            to: "static#foundation",          as: :foundation

  get "/about",                 to: "static#about",               as: :about
  get "/military",              to: "static#about_military",      as: :about_military
  get "/firefighters",          to: "static#about_firefighters",  as: :about_firefighters
  get "/first_responders",      to: "static#about_first_responders",as: :about_first_responders
  get "/community",             to: "static#about_community",      as: :about_community
  get "/entrepreneurial",       to: "static#about_entrepreneurial",as: :about_entrepreneurial
  get "/creative",              to: "static#about_creative",       as: :about_creative

  get "/departments",           to: "static#about_departments",    as: :about_departments
  get "/organizations",         to: "static#about_organizations",  as: :about_organizations
  get "/families",              to: "static#about_families",       as: :about_families

  match "/explore" => "explore#index", as: :explore
  match "/explore#:quick" => "explore#index", as: :explore_quick
  match "/credits" => "credits#index", as: :credits

  match "/reward/:id" => "rewards#show", as: :reward
  resources :posts, only: [:index, :create]

  namespace :reports do
    resources :backer_reports_for_project_owners, only: [:index]
  end

  resources :projects do
    resources :updates, only: [ :index, :create, :destroy ]
    resources :rewards, only: [ :index, :create, :update, :destroy ] do
      member do
        post 'sort'
      end
    end
    resources :backers, controller: 'projects/backers', only: [ :index, :show, :new, :create ] do
      member do
        match 'credits_checkout'
        post 'update_info'
      end
    end
    collection do
      get 'video'
      get 'check_slug'
    end
    member do
      put 'pay'
      get 'embed'
      get 'video_embed'
    end
  end
  resources :users do
    resources :backers, only: [:index] do
      member do
        match :request_refund
      end
    end

    resources :unsubscribes, only: [:create]
    member do
      get 'projects'
      get 'credits'
      put 'unsubscribe_update'
      put 'update_email'
      put 'update_password'
    end
  end
  # match "/users/:id/request_refund/:back_id" => 'users#request_refund'

  resources :credits, only: [:index] do
    collection do
      get 'buy'
      post 'refund'
    end
  end

  namespace :adm do
    resources :projects, only: [ :index, :update, :destroy ] do
      member do
        put 'approve'
        put 'reject'
        put 'push_to_draft'
      end
    end

    resources :financials, only: [ :index ]

    resources :backers, only: [ :index, :update ] do
      member do
        put 'confirm'
        put 'pendent'
        put 'change_reward'
        put 'refund'
        put 'hide'
        put 'cancel'
      end
    end
    resources :users, only: [ :index ]

    namespace :reports do
      resources :backer_reports, only: [ :index ]
    end
  end

  match "/mudancadelogin" => "users#set_email", as: :set_email_users
  match "/:permalink" => "projects#show", as: :project_by_slug

  # Root path
  root to: 'projects#index'

end
