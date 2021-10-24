# frozen_string_literal: true

class Command
  attr_reader :run

  def initialize(props, &block)
    @run = block
    load_proprieties(props)
  end

  def load_proprieties(props)
    command_props = %i[
      name
      aliases
      description
      category
      usage
      args
      strict_args
      cooldown
      owner_only
      server_only
      member_permissions
      bot_permissions
    ]
    command_props.each do |prop|
      Command.attr_accessor prop
    end
    @name = props[:name]
    @aliases = props[:aliases] if props[:aliases]
    @description = props[:description] if props[:description]
    @category = props[:category] if props[:category]
    @usage = props[:usage] if props[:usage]
    @args = props[:args] if props[:args]
    @strict_args = props[:strict_args] if props[:strict_args]
    @cooldown = props[:cooldown] if props[:cooldown]
    @owner_only = true if props[:owner_only]
    @server_only = true if props[:server_only]

    client_base_permissions = %i[
      add_reactions
      send_messages
      embed_links
      attach_files
      use_external_emoji
    ]
    case props[:bot_permissions]
    when String
      permissions = props[:bot_permissions].split(/\s+/).map(&:to_sym)
      client_base_permissions.each { |p| permissions << p unless permissions.include?(p) }
      @bot_permissions = permissions
    when Array
      permissions = props[:bot_permissions].map(&:to_sym)
      client_base_permissions.each { |p| permissions << p unless permissions.include?(p) }
      @bot_permissions = permissions
    else @bot_permissions = client_base_permissions end

    @member_permissions = case props[:member_permissions]
                          when String
                            props[:member_permissions].split(/\s+/).map(&:to_sym)
                          else [] end
    command_props.each { |p| instance_variable_set(:"@#{p}", false) unless instance_variable_get(:"@#{p}") }
  end
  private :load_proprieties
end
