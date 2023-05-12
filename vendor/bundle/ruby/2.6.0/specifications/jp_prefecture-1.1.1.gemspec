# -*- encoding: utf-8 -*-
# stub: jp_prefecture 1.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jp_prefecture".freeze
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["chocoby".freeze]
  s.date = "2022-03-25"
  s.description = "Convert japan prefecture code (JIS X 0402 based) into prefecture name.".freeze
  s.email = ["chocoby@himajin.dev".freeze]
  s.homepage = "https://github.com/chocoby/jp_prefecture".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.4.5".freeze
  s.summary = "Convert japan prefecture code into prefecture name".freeze

  s.installed_by_version = "3.4.5" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<activerecord>.freeze, [">= 5.0.0"])
  s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop-rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, [">= 0"])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
end
