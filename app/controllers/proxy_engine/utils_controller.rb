class ProxyEngine::UtilsController < ApplicationController
  
  def proxy
    # We want to grab params that are part of the requested URL, but ignore ones that are supplied by Rails
    ignored_params = ['proxy_url', 'action', 'controller']
    # The following line works but seems irresponsible
    url_params = params.permit!.to_h.reject{|param, val| ignored_params.include?(param) }.collect{ |param, val| "#{param}=#{CGI.escape(val)}" }.join('&')
    url = params[:proxy_url]
    if url.blank?
      render nothing: true
      return
    end
    url += '&' + url_params unless url_params.blank?
    url = InterfaceUtils::Server.get_url + url if url[0,1] == '/'
    # Any "&"s in the url sent to wiki_readparamer.php need to be replaced by "%26"
    if url =~ /wiki_reader\.php\?url=/
      url_split = url.split('wiki_reader.php?url=')
      url_split[1].gsub!('&', '%26')
      url = url_split.join('wiki_reader.php?url=')
    end
    
    # Parse the URL with URI.parse() so we can work with its parts more easily
    uri = URI.parse(URI.encode(url));
    
    # Required for requests without paths (e.g. http://www.google.com)
    uri.path = '/' if uri.path.empty?
    path = uri.query.blank? ? uri.path : "#{uri.path}?#{uri.query}"
    begin
      http = Net::HTTP.new(uri.host, uri.port)
      http.read_timeout=360 # timeout in seconds. Yeah, that's 6 minutes.
      result = http.get(path) # start {|web| web.request(request)}
      render plain: result.body
    rescue Timeout::Error
      render nothing: true
    end
  end
end