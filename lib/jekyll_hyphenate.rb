require_relative 'hyphenator'

module Jekyll
  # Lets get this party started
  module Hyphenate
    def hyphenate(content)
      config = @context.registers[:site].config['hyphenate'] || {}
      config = { 'language' => 'en_us',
                 'left' => 2,
                 'right' => 2,
                 'hyphen' => Hyphenator::SOFT_HYPHEN_CHAR,
                 'selector' => 'p' }.merge!(config)
      hyphenator = Hyphenator.new(language: config['language'],
                                  left: config['left'],
                                  right: config['right'],
                                  hyphen: config['hyphen'],
                                  selector: config['selector'])
      hyphenator.hyphenate(content)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Hyphenate)
