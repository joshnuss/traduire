# Traduire

A utility for translating Rails apps.

Locates strings that need translating and localizes them.

Before:

```ruby
# example.rb
puts "Hello World!!"
```

After:

```ruby
# example.rb
puts I18n.t(:hello_world)

# config/locales/en.yml
hello_world: Hello World!!
```

## Installation

    $ gem install traduire

## Usage

### Translate a file

    $ traduire example.rb

### Translate multiple files

    $ traduire **/*.rb **/*.html.erb

### Cherry pick

    $ traduire example.rb --patch

## Supported Formats

| Format     | Extension  | Supported |
| ---------- | ---------- | --------- |
| Ruby       | .rb        | planned   |
| HTML       | .html.erb  | planned   |
| JavaScript | .js        | planned   |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joshnuss/traduire.

