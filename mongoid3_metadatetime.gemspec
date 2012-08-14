# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid3/metastamp/version"

Gem::Specification.new do |s|
  s.name        = "mongoid3_metastamp"
  s.version     = Mongoid3::Meta::VERSION
  s.authors     = ["Niels Vandekeybus"]
  s.email       = ["nvdk@arguslabs.be"]
  s.homepage    = ""
  s.summary     = "Provides Mongoid (3.0 and later) with enhanced meta-timestamps"
  s.description = "Provides Mongoid with enhanced meta-timestamps that store additional parsed time metadata, allowing more powerful querying on specific time fields and across normalized time zones."

  s.rubyforge_project = "mongoid3_metastamp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "mongoid", ">=3.0.0"
end
