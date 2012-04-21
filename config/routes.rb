Rails.application.routes.draw do
  namespace :proxy_engine do
    match 'proxy_engine/utils/proxy/' => 'utils#proxy'
  end
end