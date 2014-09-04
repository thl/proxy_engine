Rails.application.routes.draw do
  namespace :proxy_engine do
    get 'utils/proxy/', to: 'utils#proxy', :as => 'proxy'
  end
end