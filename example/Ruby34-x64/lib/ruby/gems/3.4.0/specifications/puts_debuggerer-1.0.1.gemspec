# -*- encoding: utf-8 -*-
# stub: puts_debuggerer 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "puts_debuggerer".freeze
  s.version = "1.0.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2024-06-28"
  s.description = "Debuggers are great! They help us troubleshoot complicated programming problems by inspecting values produced by code, line by line. They are invaluable when trying to understand what is going on in a large application composed of thousands or millions of lines of code.\nIn day-to-day test-driven development and simple debugging though, a puts statement can be a lot quicker in revealing what is going on than halting execution completely just to inspect a single value or a few. This is certainly true when writing the simplest possible code that could possibly work, and running a test every few seconds or minutes. Problem is you need to locate puts statements in large output logs, know which file names, line numbers, classes, and methods contained the puts statements, find out what variable names are being printed, and see nicely formatted output. Enter puts_debuggerer. A guilt-free puts debugging Ruby gem FTW that prints file names, line numbers, class names, method names, and code statements; and formats output nicely courtesy of awesome_print.\nPartially inspired by this blog post: https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html (Credit to Tenderlove.)\n".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/AndyObtiva/puts_debuggerer".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Ruby library for improved puts debugging, automatically displaying bonus useful information such as source file name, line number, class name, method name, and source code.".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<awesome_print>.freeze, ["~> 1.9.2".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5".freeze])
  s.add_development_dependency(%q<rspec-mocks>.freeze, ["~> 3.5".freeze])
  s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3.9".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 2.1.4".freeze])
  s.add_development_dependency(%q<logging>.freeze, [">= 2.3.0".freeze])
  s.add_development_dependency(%q<rake-tui>.freeze, [">= 0".freeze])
end
