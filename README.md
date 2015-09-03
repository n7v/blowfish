# Blowfish
[![Build Status](https://travis-ci.org/n7v/blowfish.png)](https://travis-ci.org/n7v/blowfish)
[![Gem Version](https://badge.fury.io/rb/blowfish.png)](http://badge.fury.io/rb/blowfish)
[![Coverage Status](https://coveralls.io/repos/n7v/blowfish/badge.png)](https://coveralls.io/r/n7v/blowfish)
[![Code Climate](https://codeclimate.com/github/n7v/blowfish.png)](https://codeclimate.com/github/n7v/blowfish)
[![Dependency Status](https://gemnasium.com/n7v/blowfish.png)](https://gemnasium.com/n7v/blowfish)

Pure-ruby implementation of the Blowfish cipher.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blowfish'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blowfish

## Usage

```ruby
require 'blowfish'

key = Blowfish::Key.generate('123456')
str = "abc"
encrypted_str = Blowfish.encrypt(str, key)
decrypted_str = Blowfish.decrypt(encrypted_str, key)
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

