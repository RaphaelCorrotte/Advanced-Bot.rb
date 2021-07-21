# frozen_string_literal: true

require_relative "../lib/advanced_ruby_command_handler"

CommandHandler.new(:commands_dir => "tests/commands", :events_dir => "tests/events", :config_file => "tests/config.yml").run
