# -*- encoding: utf-8 -*-
# stub: perfect-shape 1.0.8 ruby lib

Gem::Specification.new do |s|
  s.name = "perfect-shape".freeze
  s.version = "1.0.8".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2023-05-27"
  s.description = "Perfect Shape is a collection of pure Ruby geometric algorithms that are mostly useful for GUI manipulation like checking viewport rectangle intersection or containment of a mouse click point in popular geometry shapes such as rectangle, square, arc (open, chord, and pie), ellipse, circle, polygon, and paths containing lines, quadratic b\u00E9zier curves, and cubic bezier curves, potentially with affine transforms applied like translation, scale, rotation, shear/skew, and inversion (including both the Ray Casting Algorithm, aka Even-odd Rule, and the Winding Number Algorithm, aka Nonzero Rule). Additionally, it contains some purely mathematical algorithms like IEEEremainder (also known as IEEE-754 remainder).".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/AndyObtiva/perfect-shape".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.1".freeze
  s.summary = "Perfect Shape - Geometric Algorithms".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<matrix>.freeze, [">= 0.4.2".freeze, "< 1.1.0".freeze])
  s.add_runtime_dependency(%q<equalizer>.freeze, [">= 0.0.11".freeze, "< 1.1.0".freeze])
  s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.14.4".freeze])
  s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.3.1".freeze])
  s.add_development_dependency(%q<puts_debuggerer>.freeze, ["~> 0.13.1".freeze])
  s.add_development_dependency(%q<rake-tui>.freeze, ["> 0".freeze])
end
