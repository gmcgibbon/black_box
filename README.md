# BlackBox

Static wrappers for instantiated classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'black_box'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install black_box

## Usage

1. Make a box class that extends from `BlockBox::Base` (or includes `BlackBox::Concern`).
2. Specify a subject class with `.subject`.
3. Define initialization parameters with `.accept`.
4. Define methods to delegate with `.expose`.
5. Set initialization parameters with `.configure`.

```ruby
# Require your subject
require 'api_object'

# Make your black box
class Api < BlackBox::Base

  subject ApiObject

  accept :token, :ssl

  expose :find

end

# Configure your black box
Api.configure do |api|
  api.token = 'my_api_token'
  api.ssl   = true
end

# Use your black box
Api.find(12)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gmcgibbon/black_box. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
