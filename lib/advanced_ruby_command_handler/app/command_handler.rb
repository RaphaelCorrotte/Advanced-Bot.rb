# frozen_string_literal: true

require_relative "app"

module AdvancedRubyCommandHandler
  module CommandHandler
    def self.load_commands(client)
      commands = []
      Dir.entries(client.commands_dir).each do |dir|
        next if dir == "." || dir == ".."

        Dir.entries("#{client.commands_dir}/#{dir}").each do |file|
          next if file == "." || file == ".."

          load "#{client.commands_dir}/#{dir}/#{file}"

          commands << file
        end
      end
      commands
    end
  end
end
