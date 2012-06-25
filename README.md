Brane is a simple [Markov chain](http://en.wikipedia.org/wiki/Markov_chain) generator which stores its data in a [Tokyo Cabinet](http://fallabs.com/tokyocabinet/) database.

### Installation

You'll need Tokyo Cabinet installed. If you're using [Homebrew](http://mxcl.github.com/homebrew/) on OS X, this is easy: `brew install tokyo-cabinet`.

Then, install Brane: `gem install brane`.

### Usage

By default, `Brane.new` will create a `brane.tcb` Tokyo Cabinet database in the current directory. If you'd like, you may supply a path: `Brane.new("/usr/local/etc/brane/brane.tcb")`.

```ruby
brane = Brane.new

File.open("chatter.txt") do |f|
  f.each_line do |line|
    brane.add(line)
  end
end

5.times do
  puts brane.sentence #=> "my legs are almost better than youtube comments"
end

brain.sleep
```

### License <small>(MIT)</small>

Copyright (c) 2012 Ross Paffett

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
