# frozen_string_literal: true

module Errors
  class LoadCommandError < RuntimeError
    attr_reader :command

    def initialize(command, message = nil)
      super(message)
      @command = command
    end
  end

  class LoadEventError < RuntimeError
    attr_reader :event

    def initialize(event, message = nil)
      super(message)
      @event = event
    end
  end

  class MissingEnvironmentVariable < RuntimeError
    attr_reader :environment_variable

    def initialize(environment_variable, message = nil)
      super(message)
      @environment_variable = environment_variable
    end
  end

  class MissingParameter < RuntimeError
    attr_reader :parameter

    def initialize(parameter, message = nil)
      super(message)
      @parameter = parameter
    end
  end

  class NonExistingModule < RuntimeError
    attr_reader :module_name

    def initialize(module_name, message = nil)
      super(message)
      @module_name = module_name
    end
  end
end
