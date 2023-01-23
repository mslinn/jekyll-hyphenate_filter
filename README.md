# `jekyll_hyphenate`
[![Gem Version](https://badge.fury.io/rb/jekyll_hyphenate.svg)](https://badge.fury.io/rb/jekyll_hyphenate)
===========

##NB
From the [W3 standard](https://www.w3.org/TR/css-text-3/#hyphenation):

> Hyphenation occurs when the line breaks at a valid hyphenation opportunity, which is a type of soft wrap opportunity that exists within a word where hyphenation is allowed. In CSS hyphenation opportunities are controlled with the hyphens property. CSS Text Level 3 does not define the exact rules for hyphenation; however UAs are strongly encouraged to optimize their choice of break points and to chose language-appropriate hyphenation points.

> hyphens
Value:	none | manual | auto
Initial:	manual

... so just set `hyphens: auto` in the CSS for `body`, like this:

```css
  body {
    hyphens: auto;
  }
```

However:

> Correct automatic hyphenation requires a hyphenation resource appropriate to the language of the text being broken. The UA must therefore only automatically hyphenate text for which the content language is known and for which it has an appropriate hyphenation resource.

> Authors should correctly tag their content’s language (e.g. using the HTML lang attribute or XML xml:lang attribute) in order to obtain correct automatic hyphenation.


# *WORK STOPPED AFTER I FOUND THE ABOVE*

Jekyll Liquid filter to apply [Text::Hyphen][] to content
contained within HTML tags that containing text.
The tags to examine can be configured;
the default tags to process are `a`, `li`, and `p`.


## Installation

Add this line to your Jekyll project's Gemfile, within the `jekyll_plugins` group:

```ruby
group :jekyll_plugins do
  gem 'jekyll_hyphenate'
end
```

And then execute:

    $ bundle install


## Use

To hyphenate content, use the filter like this:

    {{ content | hyphenate }}


## Configuration

There are a few configurable parameters which control hyphenation behavior.
These parameters are `language`, `left`, `right` and `tags`. These take the same
values as [Text::Hyphen][]. In brief:

 * `language` - language of the content. Defaults to `en_us`.
 * `left` - minimum number of characters to the left of the hyphen.
   Defaults to 2.
 * `right` - minimum number of characters to the right of the hyphen.
   Defaults to 2.
* `tags` - HTML tags to process. Defaults are `a`, `p`, and `li`.

In addition, you can specify the string used to indicate hyphenation points
with the `hyphen` parameter. The default is the UTF-8 soft-hyphen character
(Unicode code U+00AD). Note that this is the UTF-8 character, not an entity.

You can update `_config.yml` to set these parameters. For example:

    hyphenate_filter:
      language: en_uk
      left: 4
      right: 3
      hyphen: "&shy;"
      tags: a,li,p

This configuration sets the language to UK English, with a minimum of 4
characters to the left of the hyphenation, minimum 3 characters to the right,
and the HTML entity `&shy;` to indicate hyphenation points.


## Demo
[text::hyphen]: https://github.com/halostatue/text-hyphen

See [demo/index.html](demo/index.html) for examples.

Run the demo website by typing:
```shell
$ demo/_bin/debug -r
```
... and point your web browser to http://localhost:4444


## Additional Information
More information is available on
[Mike Slinn&rsquo;s website](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## New Implementation
This plugin is meant as a replacement for the abandoned [`grzm/jekyll_hyphenate`](http://github.com/grzm/jekyll_hyphenate) Jekyll filter.
It directly calls the [`rubygems.org/gems/text-hyphen`](https://rubygems.org/gems/text-hyphen) Ruby gem.

This will be a new implementation,
not based on [Jekyll::HyphenateFilter](https://github.com/aucor/jekyll-plugins/blob/master/hyphenate.rb) from [Jekyll plugins by Aucor](https://github.com/aucor/jekyll-plugins),
but (mostly?) upward compatible with `grzm/jekyll_hyphenate`.


## Development
After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


To build and install this gem onto your local machine, run:
```shell
$ bundle exec rake install
jekyll_hyphenate 0.1.0 built to pkg/jekyll_hyphenate-0.1.0.gem.
jekyll_hyphenate (0.1.0) installed.
```

Examine the newly built gem:
```shell
$ gem info jekyll_hyphenate

*** LOCAL GEMS ***

jekyll_hyphenate (0.1.0)
    Author: Mike Slinn
    Homepage: https://github.com/mslinn/jekyll_hyphenate
    License: MIT
    Installed at: /home/mslinn/.gems

    Jekyll filter plugin for hyphenation.
```


## Copyright

- Copyright 2023 Michael Slinn.
- Released under the MIT License (see LICENSE for details).
