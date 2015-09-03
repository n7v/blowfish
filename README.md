# Blowfish
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

