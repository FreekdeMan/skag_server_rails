AdwordsOnRails::Application.routes.draw do
  get "home/index"

  get "campaign/index"

  get "account/index"
  get "account/input"
  get "account/select"

  get "login/prompt"
  get "login/callback"
  get "login/logout"

  get "report/index"
  post "report/get"
  get "report/sqr_example" => "report#sqr_example", :as => :sqr_example

  root :to => "home#index"
end
