# -*- encoding: utf-8 -*-
# stub: bootstrap-generators 3.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-generators"
  s.version = "3.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["D\u{e9}cio Ferreira"]
  s.date = "2015-05-09"
  s.description = "Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1). Checkout http://getbootstrap.com."
  s.email = ["decio.ferreira@decioferreira.com"]
  s.homepage = "https://github.com/decioferreira/bootstrap-generators"
  s.licenses = ["MIT"]
  s.rubyforge_project = "bootstrap-generators"
  s.rubygems_version = "2.5.1"
  s.summary = "Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1)."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<railties>, [">= 3.1.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<railties>, [">= 3.1.0"])
  end
end
