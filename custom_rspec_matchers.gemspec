# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "custom_rspec_matchers"
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["kenny ortmann", "matt simpson", "amos king"]
  s.email       = ['kenny.ortmann@gmail.com', 'matt.simpson@asolutions.com', 'amos.king@asolutions.com']
  s.homepage    = ""
  s.summary     = %q{a few custom rspec matchers we have created to help with testing}
  s.description = %q{custopm rspec mathcers }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency('rake')
  s.add_dependency('rspec', '~>2.0')
  s.add_dependency('actionpack', '~>3.0')
  s.add_dependency('activemodel', '~>3.0')

end
