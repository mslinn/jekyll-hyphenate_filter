# `jekyll-hyphenate_filter`
[![Gem Version](https://badge.fury.io/rb/jekyll-hyphenate_filter.svg)](https://badge.fury.io/rb/jekyll-hyphenate_filter)
===========

# *WORK IN PROGRESS*
# *Nothing to see here yet, move along*

Jekyll Liquid filter to apply [Text::Hyphen][] to content contained within HTML tags that containing text.
The tags to examine can be configured; the default tags to process are `p` and `li`.

## Installation

Add this line to your Jekyll project's Gemfile, within the `jekyll_plugins` group:

```ruby
group :jekyll_plugins do
  gem 'jekyll-hyphenate_filter'
end
```

And then execute:

    $ bundle install


## Use

To hyphenate content, use the filter like this:

    {{ content | hyphenate }}


## Configuration

There are a few configurable parameters which control hyphenation behavior.
These parameters are `language`, `left`, and `right`. These take the same
values as [Text::Hyphen][]. In brief:

 * `language` - language of the content. Defaults to `en_us`.
 * `left` - minimum number of characters to the left of the hyphen.
   Defaults to 2.
 * `right` - minimum number of characters to the right of the hyphen.
   Defaults to 2.

In addition, you can specify the string used to indicate hyphenation points
with the `hyphen` parameter. The default is the UTF-8 soft-hyphen character
(Unicode code U+00AD). Note that this is the UTF-8 character, not an entity.

You can update `_config.yml` to set these parameters. For example:

    hyphenate_filter:
      language: en_uk
      left: 4
      right: 3
      hyphen: "&shy;"
      tags: p,li

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

This plugin is meant as a drop-in replacement for the abandoned [`grzm/jekyll-hyphenate_filter`](http://github.com/grzm/jekyll-hyphenate_filter) Jekyll filter.

For continuity, the gem built has the same name.
This will be a new implementation,
not based on [Jekyll::HyphenateFilter][] from [Jekyll plugins by Aucor][aucor-jekyll-plugins],
but upward compatible with `grzm/jekyll-hyphenate_filter`.
It directly calls the [`rubygems.org/gems/text-hyphen`](https://rubygems.org/gems/text-hyphen) Ruby gem.


## Development
After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


To build and install this gem onto your local machine, run:
```shell
$ bundle exec rake install
jekyll-hyphenate_filter 0.1.0 built to pkg/jekyll-hyphenate_filter-0.1.0.gem.
jekyll-hyphenate_filter (0.1.0) installed.
```

Examine the newly built gem:
```shell
$ gem info jekyll-hyphenate_filter

*** LOCAL GEMS ***

jekyll-hyphenate_filter (0.1.0)
    Author: Mike Slinn
    Author: Michael Glaesemann
    Homepage: https://github.com/mslinn/jekyll-hyphenate_filter
    License: MIT
    Installed at: /home/mslinn/.gems

    Jekyll filter plugin for hyphenation.
```


## Copyright

- Portions Copyright 2023 Michael Slinn.
- Portions Copyright 2016 Michael Glaesemann.
- Released under the MIT License (see LICENSE for details).
