Gem::Specification.new do |s|
  s.name          = 'logstash-filter-jsonrehasherfilter'
  s.version       = '1.0.0'
  s.licenses      = ['Nonstandard']
  s.summary       = "Filters json keys with dots to a true nested structure."
  s.description   = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors       = ["Jason Giedymin"]
  s.email         = 'jason.giedymin@gmail.com'
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','Gemfile']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", ">= 2.0.0", "< 3.0.0"
  s.add_development_dependency 'logstash-devutils'
end
