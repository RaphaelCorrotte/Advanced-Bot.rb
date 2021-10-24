# frozen_string_literal: true

module Events
  def self.message(command_handler)
    Event.new(:message, command_handler.client) do |message|
      next unless message.content.start_with?(ENV["BOT_BASE_PREFIX"])

      args = message.content.slice(ENV["BOT_BASE_PREFIX"].size, message.content.size).strip.split(/\s+/)
      command = command_handler.find_command(args.shift)

      next unless command

      command.run.call(command_handler.client, message.message)
      Logger.check("Command #{command.name} used!")
    end
  end
end
