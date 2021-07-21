# frozen_string_literal: true

require_relative "../lib/advanced_ruby_command_handler"

client = CommandHandler.new(:commands_dir => "tests/commands", :events_dir => "tests/events", :config_file => "tests/config.yml")

AdvancedRubyCommandHandler::FILE_LOGGER.write("Test!", :errors)

puts client.commands
