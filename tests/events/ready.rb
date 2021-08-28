# frozen_string_literal: true

module Events
  def self.ready(client)
    client.ready do
      client.console_logger.info("Client ready!")
    end
  end
end
