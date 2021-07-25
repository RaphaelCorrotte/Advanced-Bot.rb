# frozen_string_literal: true

require_relative "app"

module AdvancedRubyCommandHandler
  module EventHandler
    def self.load_events(client)
      events = []
      Dir.entries(client.events_dir).each do |file|
        next if %w(. ..).include?(file)

        load "#{client.events_dir}/#{file}"
        events << File.basename(file, ".rb")
      end

      Dir.entries("lib/advanced_ruby_command_handler/defaults/events").each do |file|
        next if %w(. ..).include?(file)

        next if events.include?(File.basename(file, ".rb"))

        load "lib/advanced_ruby_command_handler/defaults/events/#{file}"

        events << File.basename(file, ".rb")
      end

      events
    end
  end
end
