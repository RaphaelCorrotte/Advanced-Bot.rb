# frozen_string_literal: true

require "event_emitter"
require File.expand_path("base", File.dirname(__FILE__))
require File.expand_path("utils", File.dirname(__FILE__))

class CommandHandler < BaseCommandHandler
  include EventEmitter
  include Utils
  attr_reader :client, :commands, :events, :commands_module, :events_module, :loaded_events

  def initialize(options)
    super(options)
    @client = AdvancedRubyCommandHandler::Client.new
    @loaded_events = []

    Thread.new do
      Logger.info("Type '.reload' to load/reload all the commands & events files")
      loop do
        next unless $stdin.gets.chomp == ".reload"

        load_commands
        load_events
        Logger.check("All commands & events loaded")
      end
    end
  end

  def load_commands
    @commands = []
    Dir.entries(@commands_dir).each do |dir|
      next if %w[. ..].include?(dir)

      Dir.entries("#{@commands_dir}#{dir}").each do |file|
        next if %w[. ..].include?(file)

        load File.join(@commands_dir, dir, file)
        @commands << File.basename(file, ".rb")
      end
    end
    @commands_module = get_module_by_string(@commands_module_name)

    emit :commands_loaded, @commands
    self
  end

  def load_events
    @events = []
    Dir.entries(@events_dir).each do |file|
      next if %w[. ..].include?(file)

      load File.join(@events_dir, file)
      @events << File.basename(file, ".rb")
    end

    Dir["#{File.dirname(__FILE__)}/defaults/events/*.rb"].sort.each do |default_event|
      next if @loaded_events.include?(File.basename(default_event, ".rb")) || @events.include?(File.basename(default_event, ".rb"))

      require default_event

      @events << File.basename(default_event, ".rb")
    end
    @event_module = get_module_by_string(@events_module_name)

    emit :events_loaded, @events

    @events.each do |event|
      next if @loaded_events.include?(event)

      @event_module.method(event).call(self)
      @loaded_events << event
    end

    self
  end
end
