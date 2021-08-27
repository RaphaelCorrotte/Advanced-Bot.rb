# frozen_string_literal: true

require_relative "../../utils"

module Events
  def self.message(client)
    client.message(:start_with => client.config[:prefix]) do |message|
      args = message.content.slice(client.config[:prefix].size, message.content.size).split(" ")
      name = args.shift
      command = CommandHandler::Utils.get_command(name)

      next unless command

      command.run.call(message, client)
    end
  end
end
