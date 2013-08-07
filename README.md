# Nomen [![Build Status](https://secure.travis-ci.org/abevoelker/nomen.png)](http://travis-ci.org/abevoelker/nomen)

Simple library for formatting (and maybe later, parsing) human names.

## Description

The name is latin for "name"; no misandry intended. For now I'm only handling
my current use case, which is very basic formatting of American-style names.

I am aware of the [complexity of][patio11] human names.

## Synopsis

```ruby
require 'nomen'

n = Nomen::Name.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
n.format # => "Katya Verenice Voelker M.D."
n.format(:inverted) # => "Voelker, Katya Verenice M.D."
n.middle = nil
n.format # => "Katya Voelker M.D."
n.format(:inverted) # => "Voelker, Katya M.D."
```

## Copyright

Copyright (c) 2013 Abe Voelker. Released under the terms of the MIT license.
See LICENSE for details.

[patio11]: http://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/
