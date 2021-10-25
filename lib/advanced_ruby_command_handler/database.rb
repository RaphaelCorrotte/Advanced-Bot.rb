# frozen_string_literal: true

require "mongo"
require File.expand_path("base", File.dirname(__FILE__))

module AdvancedRubyCommandHandler
  class Database < BaseDatabase
    attr_accessor :client, :path

    def initialize(path)
      @path = path
      @client = Mongo::Client.new(path)
      super(@client)
    end
  end
end
