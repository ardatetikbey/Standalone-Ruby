# -*- encoding: utf-8 -*-
# stub: ipapi 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ipapi".freeze
  s.version = "1.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/ardatetikbey/ipapi-ruby/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/ardatetikbey/ipapi-ruby", "source_code_uri" => "https://github.com/ardatetikbey/ipapi-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Arda Tetik".freeze]
  s.date = "2025-04-06"
  s.description = "Ruby bindings for ipquery.io | A free and performant IP address API".freeze
  s.email = ["ardatetik1881@gmail.com".freeze]
  s.homepage = "https://github.com/ardatetikbey/ipapi-ruby".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.6.2".freeze
  s.summary = "Ruby bindings for ipquery.io".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.23.1".freeze])
end
