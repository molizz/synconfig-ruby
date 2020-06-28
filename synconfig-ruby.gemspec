# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "synconfig-ruby"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["moli"]
  s.date = "2019-08-19"
  s.description = "synconfig ruby sdk"
  s.email = "moliliang@gmail.com"
  s.files = `git ls-files`.split($/)
  s.homepage = "https://mozz.in"
  s.licenses = ["MIT"]
  s.summary = "synconfig ruby sdk"
end
