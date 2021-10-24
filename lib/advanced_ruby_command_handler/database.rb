# frozen_string_literal: true

require "mongo"
require File.expand_path("base", File.dirname(__FILE__))

module AdvancedRubyCommandHandler
  class Database < BaseDatabase
    attr_accessor :database, :path

    def initialize(path)
      @path = path
      @database = Mongo::Client.new(path)
      super(@database)
    end
  end
end
