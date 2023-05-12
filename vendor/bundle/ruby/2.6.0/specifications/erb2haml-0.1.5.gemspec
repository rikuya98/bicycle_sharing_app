# -*- encoding: utf-8 -*-
# stub: erb2haml 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "erb2haml".freeze
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Leung".freeze]
  s.date = "2013-04-20"
  s.description = "erb2haml gives Rails simple rake tasks to convert all ERB view templates to Haml.".freeze
  s.email = ["david@davidslab.com".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze, "CHANGELOG.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/dhl/erb2haml".freeze
  s.rubygems_version = "3.4.5".freeze
  s.summary = "ERB to Haml view templates conversion for Rails.".freeze

  s.installed_by_version = "3.4.5" if s.respond_to? :installed_by_version

  s.specification_version = 3

  s.add_runtime_dependency(%q<html2haml>.freeze, [">= 0"])
end
