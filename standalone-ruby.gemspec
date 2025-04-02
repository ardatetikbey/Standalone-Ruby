Gem::Specification.new do |spec|
  spec.name          = "standalone-ruby"
  spec.version       = "1.2"
  spec.authors       = ["Arda Tetik"]
  spec.email         = ["ardatetikruby@gmail.com"]

  spec.summary       = "Standalone Ruby application packager"
  spec.description   = "Make your projects installation independent!"
  spec.homepage      = "https://github.com/ardatetikbey/Standalone-Ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  # Metadata
  spec.metadata["homepage_uri"]   = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ardatetikbey/Standalone-Ruby"
  spec.metadata["changelog_uri"]  = "https://github.com/ardatetikbey/Standalone-Ruby/blob/main/CHANGELOG.md"

  spec.files = Dir.glob("{bin,lib}/**/*") + ["CHANGELOG.md"]
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
