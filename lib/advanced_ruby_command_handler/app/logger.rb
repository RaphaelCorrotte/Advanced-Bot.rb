# frozen_string_literal: true

require "fileutils"

module AdvancedRubyCommandHandler
  class Logger
    attr_reader :mode
    attr_accessor :write_targets

    COLORS = {
      :default => "\e[38m",
      :white => "\e[39m",
      :black => "\e[30m",
      :red => "\e[31m",
      :green => "\e[32m",
      :brown => "\e[33m",
      :blue => "\e[34m",
      :magenta => "\e[35m",
      :cyan => "\e[36m",
      :gray => "\e[37m",
      :yellow => "\e[33m"
    }.freeze
    MODES = {
      :info => :cyan,
      :error => :red,
      :warn => :yellow,
      :check => :green
    }.freeze
    def initialize(mode = :console, write_targets = { :errors => "logs/errors.txt", :information => "logs/infos.txt" })
      @mode = mode.to_sym
      @write_targets = write_targets if @mode == :file
    end

    def console_color(color, message)
      "#{COLORS[color]}#{message}\e[0m"
    end

    def write(message, write_target = :information)
      return Logger.new(:console).warn("The file logs aren't available on #{@mode} mode") unless @mode == :file

      time = Time.now.strftime("%Y-%m-%d-%H:%M:%S")

      FileUtils.mkdir_p File.dirname @write_targets[write_target]

      File.open(@write_targets[write_target], "w") unless File.exist? @write_targets[write_target]

      File.open(@write_targets[write_target], "w+") do |file|
        file.write("#{time} - #{write_target.to_s.upcase} : #{message}\n")
      end
    end

    MODES.each do |mode, color|
      define_method(mode) do |message|
        return Logger.new(:console).warn("The console logs aren't available on #{@mode} mode") unless @mode == :console

        time = Time.now.strftime("%Y-%m-%d-%H:%M:%S")
        puts "[#{console_color(:magenta, time)}] - [#{console_color(color, mode.to_s.upcase)}] : #{message.to_s}"
      end
    end

    private :console_color
  end
end
