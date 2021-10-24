# frozen_string_literal: true

require_relative "././../../../src/../../lib/advanced_ruby_command_handler/command"

module Commands
  def self.test
    Command.new(Hash[
                  :name => "test"
                ]) do |client, message|
      message.respond "#{client.profile.username} prêt!"
    end
  end
end
