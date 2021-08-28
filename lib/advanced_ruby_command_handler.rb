# frozen_string_literal: true

require_relative "advanced_ruby_command_handler/app/app"
require_relative "advanced_ruby_command_handler/app/command"
require_relative "advanced_ruby_command_handler/app/utils"

##
# Represent the CommandHandler as a simply class
module CommandHandler
  ##
  # @!method new
  # @param [String] commands_dir The command's directory path
  # @param [String] events_dir The event's directory path
  # @param [String] config_file The config's file path
  # @return [AdvancedRubyCommandHandler::Client] the created client
  def self.new(commands_dir: "commands", events_dir: "events", config_file: "config.yml")
    AdvancedRubyCommandHandler::Client.new(:commands_dir => commands_dir, :events_dir => events_dir, :config_file => config_file)
  end
end
