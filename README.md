
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

[![Les Laboratoires Ruby](https://invidget.switchblade.xyz/4P7XcmbDnt)](https://discord.gg/4P7XcmbDnt)

# AdvancedRubyCommandHandler
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'advanced_ruby_command_handler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install advenced_ruby_command_handler

## Usage

### Base Usage

Firstly, you have to create a ruby file, where you put the followwing line:
```rb
require "advanced_ruby_command_handler"
```

Then, initialize the command handler. Specifying the directories and the config file path

```rb
client = CommandHandler.new(commands_dir: "src/commands", events_dir: "src/events", config_file: "src/private/config.yml")
```
Note: if these files dose not exist, the command handler will create them

And run the bot:
```ruby
client.run
```

### Events&Commands

The command handler have base events as message or ready, but you can create your owns events (in events directory).

Create a file with the name of your event (see https://www.rubydoc.info/github/meew0/discordrb/Discordrb/Events)

And use the following template:
```ruby
# frozen_string_literal: true

module Events
  def self.<event>(client)
    client.<event> do
      client.console_logger.info("Event!")
    end
  end
end
```
Now, when the event will be emitted, the program will puts "Event!"

If you want to add some commands in your bot, you can create sub directories in your command directory.
In these directories, you can create ruby files for commands, here's an example:

```ruby
# frozen_string_literal: true

require_relative "advanced_ruby_command_handler"

module Commands
  def self.hello
    CommandHandler::Command.new({
                                  :name => "hello"
                                }) do |message, client|
      message.respond "Hello Discord!"
    end
  end
end
```

Now you can create events and commands ! ;)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Senchuu/Advanced-Bot.rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
