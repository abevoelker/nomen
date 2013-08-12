Nomen
========

[![Gem Version](https://badge.fury.io/rb/nomen.png)][gem]
[![Build Status](https://secure.travis-ci.org/abevoelker/nomen.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/abevoelker/nomen.png)][gemnasium]

[gem]: https://rubygems.org/gems/nomen
[travis]: http://travis-ci.org/abevoelker/nomen
[gemnasium]: https://gemnasium.com/abevoelker/nomen

Simple library for formatting (and maybe later, parsing) human names.

Description
-----------

The name is latin for "name"; no misandry intended. For now I'm only handling
my current use case, which is very basic formatting of American-style names.

I am aware of the [complexity of][patio11] human names.

Synopsis
--------

```ruby
require 'nomen'

n = Nomen.new(first: 'John', middle: 'Jacob', last: 'Smith', suffix: 'M.D.')
n.format # => "John Jacob Smith M.D."
n.format(:inverted) # => "Smith, John Jacob M.D."
n.middle = nil
n.format # => "John Smith M.D."
n.format(:inverted) # => "Smith, John M.D."
```

Copyright
---------

Copyright (c) 2013 Abe Voelker. Released under the terms of the MIT license.
See LICENSE for details.

[patio11]: http://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/
