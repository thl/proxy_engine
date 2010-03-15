ActionController::Routing::Routes.draw do |map|

  map.namespace(:proxy_engine) do |proxy_engine|
    proxy_engine.connect 'proxy_engine/utils/proxy/', :controller => 'utils', :action => 'proxy'
  end

end
