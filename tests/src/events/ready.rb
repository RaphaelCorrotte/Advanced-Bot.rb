# frozen_string_literal: true

module Events
  def self.ready(command_handler)
    Event.new(:ready, command_handler.client) do
      puts "Ready!"
    end
  end
end
