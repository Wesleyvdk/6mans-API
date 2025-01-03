# -*- encoding: utf-8 -*-
# stub: passenger 6.0.23 ruby src/ruby_supportlib
# stub: src/helper-scripts/download_binaries/extconf.rb

Gem::Specification.new do |s|
  s.name = "passenger".freeze
  s.version = "6.0.23".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/phusion/passenger/issues", "changelog_uri" => "https://github.com/phusion/passenger/blob/stable-6.0/CHANGELOG", "documentation_uri" => "https://www.phusionpassenger.com/docs/", "homepage_uri" => "https://www.phusionpassenger.com/", "mailing_list_uri" => "https://www.phusionpassenger.com/contact", "source_code_uri" => "https://github.com/phusion/passenger", "wiki_uri" => "https://github.com/phusion/passenger/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["src/ruby_supportlib".freeze]
  s.authors = ["Phusion - http://www.phusion.nl/".freeze]
  s.date = "2024-07-23"
  s.description = "A modern web server and application server for Ruby, Python and Node.js, optimized for performance, low memory usage and ease of use.".freeze
  s.email = "software-signing@phusion.nl".freeze
  s.executables = ["passenger".freeze, "passenger-install-apache2-module".freeze, "passenger-install-nginx-module".freeze, "passenger-config".freeze, "passenger-status".freeze, "passenger-memory-stats".freeze]
  s.extensions = ["src/helper-scripts/download_binaries/extconf.rb".freeze]
  s.files = ["bin/passenger".freeze, "bin/passenger-config".freeze, "bin/passenger-install-apache2-module".freeze, "bin/passenger-install-nginx-module".freeze, "bin/passenger-memory-stats".freeze, "bin/passenger-status".freeze, "src/helper-scripts/download_binaries/extconf.rb".freeze]
  s.homepage = "https://www.phusionpassenger.com/".freeze
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A fast and robust web server and application server for Ruby, Python and Node.js".freeze

  s.installed_by_version = "3.5.19".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rake>.freeze, [">= 12.3.3".freeze])
  s.add_runtime_dependency(%q<rack>.freeze, [">= 1.6.13".freeze])
  s.add_runtime_dependency(%q<rackup>.freeze, [">= 0".freeze])
end
