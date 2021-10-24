# frozen_string_literal: true

require "fileutils"
require "yaml"
require File.expand_path("base", File.dirname(__FILE__))

module AdvancedRubyCommandHandler
  class Client < BaseClient
    def run
      Logger.check("Client run")
      Thread.new do
        Logger.info("Type '.exit' to turn off the bot")
        loop do
          Process.exit!(true) if $stdin.gets.chomp == ".exit"
        end
      end
      super.run
    end
  end
end
