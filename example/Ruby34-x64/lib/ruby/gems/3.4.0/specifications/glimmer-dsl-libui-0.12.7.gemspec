# -*- encoding: utf-8 -*-
# stub: glimmer-dsl-libui 0.12.7 ruby lib .

Gem::Specification.new do |s|
  s.name = "glimmer-dsl-libui".freeze
  s.version = "0.12.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, ".".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2025-01-12"
  s.description = "Glimmer DSL for LibUI (Fukuoka Award Winning Prerequisite-Free Ruby Desktop Development Cross-Platform Native GUI Library) - Winner of Fukuoka Ruby Award Competition 2022 Special Award (http://www.digitalfukuoka.jp/topics/187?locale=ja) - No need to pre-install any prerequisites. Just install the gem and have cross-platform native GUI that just works on Mac, Windows, and Linux! Glimmer DSL for LibUI aims to provide declarative DSL syntax that visually maps to GUI control hierarchy, convention over configuration via smart defaults, automation of low-level details, requiring the least amount of syntax possible to build GUI, bidirectional data-binding, custom control/window support, and application/gem/window/control scaffolding. If you liked Shoes, You'll love Glimmer!".freeze
  s.email = "andy.am@gmail.com".freeze
  s.executables = ["glimmer".freeze, "girb".freeze]
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze, "bin/girb".freeze, "bin/glimmer".freeze]
  s.homepage = "http://github.com/AndyObtiva/glimmer-dsl-libui".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Glimmer DSL for LibUI (Fukuoka Award Winning Prerequisite-Free Ruby Desktop Development Cross-Platform Native GUI Library)".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<glimmer>.freeze, ["~> 2.8.0".freeze])
  s.add_runtime_dependency(%q<perfect-shape>.freeze, ["~> 1.0.8".freeze])
  s.add_runtime_dependency(%q<super_module>.freeze, ["~> 1.4.1".freeze])
  s.add_runtime_dependency(%q<puts_debuggerer>.freeze, [">= 1.0.1".freeze, "< 2.0.0".freeze])
  s.add_runtime_dependency(%q<rake-tui>.freeze, [">= 0.2.3".freeze, "< 2.0.0".freeze])
  s.add_runtime_dependency(%q<os>.freeze, [">= 1.0.0".freeze, "< 2.0.0".freeze])
  s.add_runtime_dependency(%q<color>.freeze, ["~> 1.8".freeze])
  s.add_runtime_dependency(%q<rake>.freeze, [">= 10.1.0".freeze, "< 14.0.0".freeze])
  s.add_runtime_dependency(%q<libui>.freeze, ["= 0.1.2".freeze])
  s.add_runtime_dependency(%q<chunky_png>.freeze, ["~> 1.4.0".freeze])
  s.add_runtime_dependency(%q<equalizer>.freeze, ["= 0.0.11".freeze])
  s.add_runtime_dependency(%q<rouge>.freeze, [">= 3.26.0".freeze, "< 4.0.0".freeze])
  s.add_runtime_dependency(%q<text-table>.freeze, [">= 1.2.4".freeze, "< 2.0.0".freeze])
  s.add_development_dependency(%q<juwelier>.freeze, [">= 2.4.9".freeze, "< 3.0.0".freeze])
  s.add_development_dependency(%q<stringio>.freeze, ["= 3.0.1".freeze])
  s.add_development_dependency(%q<psych>.freeze, ["= 4.0.3".freeze])
  s.add_development_dependency(%q<json>.freeze, ["= 2.6.1".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<coveralls>.freeze, ["= 0.8.23".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.16.1".freeze])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, ["~> 0.7.0".freeze])
end
