# frozen_string_literal: true

module CommandHandler
  class Command
    attr_reader :props, :run

    def initialize(props, &run)
      @props = props
      @run = run
    end
  end
end
