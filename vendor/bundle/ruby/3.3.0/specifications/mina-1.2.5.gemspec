# -*- encoding: utf-8 -*-
# stub: mina 1.2.5 ruby lib tasks

Gem::Specification.new do |s|
  s.name = "mina".freeze
  s.version = "1.2.5".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "tasks".freeze]
  s.authors = ["Stjepan Hadji\u0107".freeze]
  s.date = "2023-10-03"
  s.description = "Blazing fast application deployment tool.".freeze
  s.email = ["stjepan.hadjic@infinum.co".freeze]
  s.executables = ["mina".freeze]
  s.files = ["bin/mina".freeze]
  s.homepage = "https://github.com/mina-deploy/mina".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Blazing fast application deployment tool.".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
end
