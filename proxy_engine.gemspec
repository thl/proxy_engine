$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "proxy_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "proxy_engine"
  s.version     = ProxyEngine::VERSION
  s.authors     = ["Andres Montano"]
  s.email       = ["amontano@virginia.edu"]
  s.homepage    = "http://subjects.kmaps.virginia.edu"
  s.summary     = "Engine to do a work-around cross-scripting server problems."
  s.description = "Engine to do a work-around cross-scripting server problems."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2.5'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
