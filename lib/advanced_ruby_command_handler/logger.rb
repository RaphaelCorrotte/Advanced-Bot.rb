# frozen_string_literal: true

class Logger
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

  class << self
    def console_color(color, message)
      "#{COLORS[color]}#{message}\e[0m"
    end

    private :console_color
  end

  MODES.each do |mode, color|
    define_singleton_method(mode) do |message|
      time = Time.now.strftime("%Y-%m-%d-%H:%M:%S")
      puts "[#{console_color(:magenta, time)}] - [#{console_color(color, mode.to_s.upcase)}] : #{message.to_s}"
    end
  end
end
