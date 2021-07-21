# frozen_string_literal: true

require_relative "app"

module AdvancedRubyCommandHandler
  module EventHandler
    def self.load_events(client)
      events = []
      Dir.entries(client.events_dir).each do |file|
        next if file == "." || file == ".."

        load "#{client.events_dir}/#{file}"
        events << file
      end
      events
    end
  end
end

