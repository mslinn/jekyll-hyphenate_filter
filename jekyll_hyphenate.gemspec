require_relative 'lib/jekyll_hyphenate/version'

Gem::Specification.new do |spec|
  github = 'https://github.com/mslinn/jekyll_hyphenate'

  spec.authors = ['Mike Slinn']
  spec.bindir = 'exe'
  spec.description = 'Jekyll filter plugin for hyphenation.'
  spec.email = ['mslinn@mslinn.com']
  spec.files = Dir['.rubocop.yml', 'LICENSE.*', 'Rakefile', '{lib,spec}/**/*', '*.gemspec', '*.md']
  spec.homepage = 'http://rubygems.org/gems/jekyll_hyphenate'
  spec.licenses = ['MIT']
  spec.metadata = {
    'allowed_push_host'     => 'https://rubygems.org',
    'bug_tracker_uri'       => "#{github}/issues",
    'changelog_uri'         => "#{github}/CHANGELOG.md",
    'homepage_uri'          => spec.homepage,
    'source_code_uri'       => github,
  }
  spec.name = 'jekyll_hyphenate'
  spec.post_install_message = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_path = %(lib)
  spec.required_ruby_version = '>= 2.6.0'
  spec.summary = 'Jekyll filter plugin for hyphenation.'
  spec.version = Jekyll::HyphenateFilter::VERSION

  spec.add_dependency 'jekyll', '>= 3.5.0'
  spec.add_dependency 'jekyll_plugin_logger'
  spec.add_dependency 'nokogiri', '~> 1.14'
  spec.add_dependency 'text-hyphen'
end
