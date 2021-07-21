# frozen_string_literal: true

require_relative "advanced_ruby_command_handler/app/app"

module CommandHandler
  def self.new(commands_dir: "commands", events_dir: "events", config_file: "config.yml")
    AdvancedRubyCommandHandler::Client.new(:commands_dir => commands_dir, :events_dir => events_dir, :config_file => config_file)
  end
end
