# frozen_string_literal: true

require_relative "../lib/advanced_ruby_command_handler"

command_handler = CommandHandler.new(Hash[
                                       :commands_dir => "tests/src/commands/",
                                       :events_dir => "tests/src/events/",
                                       :commands_module_name => "Commands",
                                       :events_module_name => "Events"
                                     ])
command_handler.on :commands_loaded do |commands|
  Logger.check("#{commands.size} commands loaded!")
end

command_handler.on :events_loaded do |events|
  Logger.check("#{events.size} events loaded!")
end

command_handler.load_commands
               .load_events
command_handler.client.run
