# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "asset_precompilation_finder/version"

Gem::Specification.new do |s|
  s.name        = "asset_precompilation_finder"
  s.version     = AssetPrecompilationFinder::VERSION
  s.authors     = ["Micah Geisel"]
  s.email       = ["micah@botandrose.com"]
  s.homepage    = ""
  s.summary     = %q{Railtie to set asset precompilation paths to a better default}
  s.description = %q{Sets the Rails asset precompilation path to compile everything except partials, and compile css last.}

  s.rubyforge_project = "asset_precompilation_finder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "rails", "~>3.1"
end
