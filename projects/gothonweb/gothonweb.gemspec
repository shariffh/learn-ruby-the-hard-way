# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ex47/version"

Gem::Specification.new do |s|
  s.name        = "ex47"
  s.version     = Ex47::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shariff Hussein"]
  s.email       = ["shahuma2010@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "ex47"

  s.files         = 'git ls-files'.split("\n")
  s.test_files    = 'git ls-files -- {test,spec,features}/*'.split("\n")
  s.executables   = 'git ls-files -- bin/*'.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end