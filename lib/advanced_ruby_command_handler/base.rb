# frozen_string_literal: true

require "dotenv/load"
require "fileutils"

class BaseDatabase
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def to_s
    @client.database.name
  end

  def options
    @client.hash
  end
end

class BaseClient < Discordrb::Bot
  def initialize
    %w[BOT_TOKEN BOT_BASE_PREFIX BOT_OWNER].each do |environment_variable|
      raise Errors::MissingEnvironmentVariable.new(environment_variable, "Environment variable '#{environment_variable}' missing in your .env file") unless ENV[environment_variable]
    end
    super(:token => ENV["BOT_TOKEN"], :ignore_bots => true)
  end
end

class BaseCommandHandler
  attr_accessor :commands_dir, :events_dir
  attr_reader :commands_module_name, :events_module_name

  def initialize(options)
    %i[commands_dir events_dir commands_module_name events_module_name].each do |dir|
      raise Errors::MissingParameter.new(dir, "Parameter '#{dir}' unspecified") unless options[dir]
    end
    @commands_dir = options[:commands_dir]
    @events_dir = options[:events_dir]
    @commands_module_name = options[:commands_module_name]
    @events_module_name = options[:events_module_name]
    FileUtils.mkdir_p [@commands_dir, @events_dir]
  end

  def get_module_by_string(module_name)
    raise Errors::NonExistingModule.new(module_name, "Module '#{module_name}' doesn't exist. Please specify an existing module") unless Object.const_defined?(module_name)

    Object.const_get(module_name)
  end
end
