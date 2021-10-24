# frozen_string_literal: true

require "discordrb"
require File.expand_path("advanced_ruby_command_handler/database", File.dirname(__FILE__))
require File.expand_path("advanced_ruby_command_handler/errors", File.dirname(__FILE__))
require File.expand_path("advanced_ruby_command_handler/client", File.dirname(__FILE__))
require File.expand_path("advanced_ruby_command_handler/utils", File.dirname(__FILE__))
require File.expand_path("advanced_ruby_command_handler/command_handler", File.dirname(__FILE__))
require File.expand_path("advanced_ruby_command_handler/event", File.dirname(__FILE__))
require File.expand_path("advanced_ruby_command_handler/logger", File.dirname(__FILE__))

module AdvancedRubyCommandHandler
  include Discordrb
  include Errors
  include Utils
end
