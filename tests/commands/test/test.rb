# frozen_string_literal: true

require_relative "../../../lib/advanced_ruby_command_handler/app/command"

module Commands
  def self.test
    CommandHandler::Command.new({
                                  :name => "test"
                                }) do |message, client|
      message.respond "Command test!"
    end
  end
end
