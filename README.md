# Blowfish
[![Build Status](https://travis-ci.org/n7v/blowfish.svg?branch=master)](https://travis-ci.org/n7v/blowfish)
[![Gem Version](https://badge.fury.io/rb/blowfish.svg)](http://badge.fury.io/rb/blowfish)
[![Coverage Status](https://coveralls.io/repos/n7v/blowfish/badge.svg?branch=master&service=github)](https://coveralls.io/github/n7v/blowfish?branch=master)
[![Code Climate](https://codeclimate.com/github/n7v/blowfish/badges/gpa.svg)](https://codeclimate.com/github/n7v/blowfish)
[![Dependency Status](https://gemnasium.com/n7v/blowfish.svg)](https://gemnasium.com/n7v/blowfish)

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

