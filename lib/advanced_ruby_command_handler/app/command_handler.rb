# frozen_string_literal: true

require_relative "app"

module AdvancedRubyCommandHandler
  module CommandHandler
    def self.load_commands(client)
      commands = []
      Dir.entries(client.commands_dir).each do |dir|
        next if %w[. ..].include?(dir)

        Dir.entries("#{client.commands_dir}/#{dir}").each do |file|
          next if %w(. ..).include?(file)

          load "#{client.commands_dir}/#{dir}/#{file}"

          commands << File.basename(file, ".rb")
        end
      end
      commands
    end
  end
end
