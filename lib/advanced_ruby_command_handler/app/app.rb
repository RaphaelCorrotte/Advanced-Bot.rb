# frozen_string_literal: true

require_relative "../version"
require_relative "logger"
require_relative "client"

module AdvancedRubyCommandHandler
  FILE_LOGGER = AdvancedRubyCommandHandler::Logger.new(:file)
  CONSOLE_LOGGER = AdvancedRubyCommandHandler::Logger.new(:console)
end
