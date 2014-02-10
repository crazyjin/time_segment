$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "time_segment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "time_segment"
  s.version     = TimeSegment::VERSION
  s.authors     = ["CrazyJin"]
  s.email       = ["eccentricjinp@gmail.com"]
  s.homepage    = ""
  s.summary     = "TimeSegment."
  s.description = "Class TimeSegment allows you to handle time segment easy."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 3.2.16"
  s.add_dependency "activesupport"
  s.add_dependency "rake"
  #s.add_development_dependency "sqlite3"
end
