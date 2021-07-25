# frozen_string_literal: true

module CommandHandler
  module Utils
    def self.get_command(command_name)
      return Commands.method(command_name).call if defined?(Commands) && Commands.respond_to?(command_name)

      false
    end
  end
end
