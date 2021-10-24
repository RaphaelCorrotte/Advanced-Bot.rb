# frozen_string_literal: true

class Event
  def initialize(event, client, &block)
    return unless client.methods.include?(event)

    client.method(event).call { |e| block.call(e) }
  end
end
