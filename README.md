# variable length ouptput hash for ruby

*IMPORTANT: it library is very tiny hash implement. don't use for encryption or something.*

[![Build Status](https://travis-ci.org/SNakano/digest-vlh-ruby.svg?branch=master)](https://travis-ci.org/SNakano/digest-vlh-ruby)
[![Gem](https://img.shields.io/gem/dt/digest-vlh.svg)](https://rubygems.org/gems/digest-vlh)

## Installation

Add this line to your application's Gemfile:

```
gem 'digest-vlh'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install digest-vlh
```

## Usage

```
require 'digest/vlh'

# Compute a digest
Digest::VLH.hexdigest('abc', 6) # => "fa0f4f"
Digest::VLH.hexdigest('abc', 9) # => "4ae5fa448"

Digest::VLH.digest('abc', 7)    # => "4770719"

Digest::VLH.new(200).hexdigest 'abc' # => "4b55d39a2..."
Digest::VLH.new(200).digest 'abc'    # => "862686787..."

# Compute digest by chunk
vlh = Digest::VLH.new(9)
vlh.update("ab")
vlh << "c"
vlh.hexdigest                   # => "4ae5fa448"

# Reset and another digest
vlh.reset
vlh << "message"
vlh.digest                      # => "255023916"
```
