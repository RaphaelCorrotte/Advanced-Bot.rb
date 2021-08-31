# frozen_string_literal: true

require_relative "../../../lib/advanced_ruby_command_handler/app/command"
require_relative "../../../lib/advanced_ruby_command_handler/app/utils"

module Commands
  def self.test
    CommandHandler::Command.new({
                                  :name => "test",
                                  :aliases => ["t"],
                                  :description => "Une commande pour faire des tests!",
                                  :args => false,
                                  :use_example => :default,
                                  :category => :default
                                }) do |message, _client|
      message.respond "Test"
    end
  end
end
