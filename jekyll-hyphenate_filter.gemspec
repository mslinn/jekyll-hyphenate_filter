lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require "rake"
require "jekyll/hyphenate_filter/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-hyphenate_filter"
  spec.version = Jekyll::HyphenateFilter::VERSION
  spec.licenses = ["MIT"]
  spec.summary = "jekyll-hyphenate_filter"
  spec.date = "2023-01-22"
  spec.description = "Jekyll filter plugin for hyphenation."
  spec.authors = ["Mike Slinn", "Michael Glaesemann"]
  spec.email = ["mslinn@mslinn.com", "grzm@seespotcode.net"]
  spec.files = FileList["{lib,test}/**/*.*",
                        "jekyll-hyphenate_filter.gemspec",
                        "rakefile",
                        "LICENSE",
                        "README.md",
                        "CHANGELOG.md",
                        "Gemfile",
                        "Gemfile.lock"].to_a
  spec.require_path = %(lib)
  spec.test_files = FileList["test/**/*.*"].to_a
  spec.extra_rdoc_files = ["LICENSE", "README.markdown"]
  spec.homepage = "http://rubygems.org/gems/jekyll-hyphenate_filter"
  [["text-hyphen", ["~> 1.4"]],
   ["nokogiri", ["~> 1.6"]]].each do |dep|
    spec.add_runtime_dependency(*dep)
  end

  [["test-unit", ["~> 3.0"]]].each do |dep|
    spec.add_development_dependency(*dep)
  end

end
