$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "time_segment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "time_segment"
  s.version     = TimeSegment::VERSION
  s.authors     = ["CrazyJin"]
  s.email       = ["eccentricjinp@gmail.com"]
  s.homepage    = "https://github.com/crazyjin/time_segment"
  s.summary     = "TimeSegment."
  s.description = "TimeSegment is a substitute of DateHelper distance_of_time_in_words and makes your time more readable."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 3.2.16"
  #s.add_development_dependency "sqlite3"
  s.add_dependency "activesupport"
  s.add_dependency "rake"
  s.add_dependency "rails-i18n"
end
