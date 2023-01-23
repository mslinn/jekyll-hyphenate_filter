require 'rspec/match_ignoring_whitespace'
require_relative '../lib/hyphenator'

# Lets get this party started
class HyphenateTest # rubocop:disable Metrics/ClassLength
  def self.normal_word?(text)
    Jekyll::HyphenateFilter::Hyphenator.normal_word?(text)
  end

  RSpec.describe Jekyll::Hyphenate do
    let(:config) do
      { 'language' => 'en_us',
        'left' => 2,
        'right' => 2,
        'hyphen' => Hyphenator::SOFT_HYPHEN_ENTITY,
        'selector' => 'p' }
    end

    let(:html_entities) do
      <<~END_ENTITIES
        <p>
          The ampersand character is: &amp;, and here is a &lt;tag&gt;.
          An ampersand can be used to escape text, like this: &amp;lt;nested&amp;gt;
        </p>
      END_ENTITIES
    end

    let(:html_link) do
      <<~END_CONTENT
        <p>
          Jekyll becomes useful when
          <a href="https://mslinn.com/jekyll/3000-jekyll-plugins.html#hyphenate"
            title="this is a title attribute">plugins such as this one</a>
          are used.
        </p>
      END_CONTENT
    end

    let(:html_list) do
      <<~END_ENTITIES
        <ol>
          <li>
            Hyphenation is the automated process of breaking words between
            lines to create more consistency across a text block.
          </li>
          <li>
            In justified text, hyphenation is mandatory.
          </li>
          <li>
            In left-aligned text, hyphenation evens the irregular right edge of the text, called the rag.
          </li>
        </ol>
      END_ENTITIES
    end

    let(:html_img) do
      <<~END_ENTITIES
        <div class="imgWrapper inline imgItem">
          <figure>
            <a href="/softwareexpert/index.html" class="imgImgUrl">
              <picture class="imgPicture">
                <source srcset="/demo/assets/images/jekyll_240x103.webp" type="image/webp">
                <source srcset="/demo/assets/images/jekyll_240x103.png" type="image/png">
                <img src="/demo/assets/images/jekyll_240x103.png"
                  title="This is a title"
                  style="width: 100%; "
                  alt="This is alt text">
              </picture>
            </a>
            <figcaption>
              <a href="/softwareexpert/index.html">
                This is a caption with extraordinarily and unusually vociferious wolverines
                stalking their unsuspecting prey
              </a>
            </figcaption>
          </figure>
        </div>
      END_ENTITIES
    end

    it 'hyphenates normal words' do
      expect(HyphenateTest.normal_word?('<p>Fred</p>')).to be true
      expect(HyphenateTest.normal_word?('<p>&amp;</p>')).to be false
    end

    it 'hyphenates without sub-elements' do
      hyphenated = Jekyll::HyphenateFilter::Hyphenator.new.hyphenate(html_entities)
      expect(hyphenated).to match_ignoring_whitespace <<-END_RESULT
        <p>
          The ampersand character is: &amp;, and here is a &lt;tag&gt;.
          An ampersand can be used to escape text, like this: &amp;lt;nested&amp;gt;
        </p>
      END_RESULT
    end

    it 'hyphenates with sub-elements' do
      hyphenated = Jekyll::HyphenateFilter::Hyphenator.new.hyphenate(html_link)
      expect(hyphenated).to match_ignoring_whitespace <<-END_RESULT
        <p>
          Jekyll becomes useful when
          <a href="https://mslinn.com/jekyll/3000-jekyll-plugins.html#hyphenate"
            title="this is a title attribute">plugins such as this one</a>
          are used.
        </p>
      END_RESULT
    end

    it 'hyphenates with img sub-elements' do
      hyphenated = Jekyll::HyphenateFilter::Hyphenator.new.hyphenate(html_img)
      expect(hyphenated).to match_ignoring_whitespace <<-END_RESULT
        <div class="imgWrapper inline imgItem">
          <figure>
            <a href="/softwareexpert/index.html" class="imgImgUrl">
              <picture class="imgPicture">
                <source srcset="/demo/assets/images/jekyll_240x103.webp" type="image/webp">
                <source srcset="/demo/assets/images/jekyll_240x103.png" type="image/png">
                <img src="/demo/assets/images/jekyll_240x103.png"
                  title="This is a title"
                  style="width: 100%; "
                  alt="This is alt text">
              </picture>
            </a>
            <figcaption>
              <a href="/softwareexpert/index.html">
                This is a caption with extraordinarily and unusually vociferious wolverines
                stalking their unsuspecting prey
              </a>
            </figcaption>
          </figure>
        </div>
      END_RESULT
    end
  end
end
