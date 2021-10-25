
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

[Les Laboratoires Ruby](https://discord.gg/4P7XcmbDnt)

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

Then, initialize the command handler. Specifying the directories and the modules.

```rb
command_handler = CommandHandler.new(Hash[
                                       :commands_dir => "src/commands/",
                                       :events_dir => "src/events/",
                                       :commands_module_name => "Commands",
                                       :events_module_name => "Events"
                                     ])
                                .load_commands
                                .load_events
```
Note: if these directories dosen't exist, the command handler will create them

And run the bot:
```ruby
command_handler.client.run
```

### Events&Commands

The command handler have base events as message or ready, but you can create your owns events (in events directory).

Create a file with the name of your event (see [https://www.rubydoc.info/github/meew0/discordrb/Discordrb/Events](the doc))

And use the following template:
```ruby
# src/events/message.rb
# frozen_string_literal: true

module Events
  # self.<event_name>
  def self.message(command_handler)
    Event.new(:message, command_handler.client) do |message|
      Logger.check("Message! : #{message.content}")
    end
   end
end
```
Now, when a message is sent, the program will puts "Message! : 'message content'"

If you want to add some commands in your bot, you can create sub directories in your command directory.
In these directories, you can create ruby files for commands, here's an example:

```ruby
# src/commands/utils/ping.rb
# frozen_string_literal: true

module Commands
  # self.<command_name>
  def self.ping
    Command.new(Hash[
                  :name => "ping"
                ]) do |client, message|
      message.respond "Pong!"
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
