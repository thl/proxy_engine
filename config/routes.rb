Rails.application.routes.draw do
  namespace :proxy_engine do
    match 'utils/proxy/' => 'utils#proxy', :as => 'proxy'
  end
end