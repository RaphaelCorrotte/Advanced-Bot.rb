# frozen_string_literal: true

module Utils
  def find_command(name)
    return unless commands_module.methods.include?(name.to_sym)

    commands_module.method(name.to_sym).call
  end
end
