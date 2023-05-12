# -*- encoding: utf-8 -*-
# stub: omniauth-strava 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-strava".freeze
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tim Hogg".freeze]
  s.date = "2013-09-13"
  s.description = "OmniAuth strategy for Strava.".freeze
  s.email = ["thogg4@gmail.com".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "3.4.5".freeze
  s.summary = "OmniAuth strategy for Strava.".freeze

  s.installed_by_version = "3.4.5" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<omniauth>.freeze, ["~> 1.0"])
  s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 2.7"])
  s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
end
