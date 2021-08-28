# frozen_string_literal: true

module CommandHandler
  class Command
    attr_reader :props, :run

    def initialize(props, &run)
      @props = load_proprieties(props)
      @run = run
    end

    def load_proprieties(props)
      return props unless props.instance_of?(Hash)

      props[:aliases] ||= nil
      props[:description] ||= nil
      props[:args] ||= nil
      props[:strict_args] ||= false
      props[:use_example] ||= nil
      props[:category] ||= nil
      props[:user_permissions] ||= []
      props[:client_permissions] ||= []

      if props[:category] == :default; end

      if props[:client_permissions].instance_of?(Array) && props[:client_permissions].empty?
        props[:client_permissions].push(
          :add_reactions,
          :send_messages,
          :embed_links,
          :attach_files,
          :use_external_emoji
        )
      elsif props[:client_permissions] == :default
        props[:client_permissions] = %i[
          add_reactions
          send_messages
          embed_links
          attach_files
          use_external_emoji
        ]
      end

      Hash[
        :name => props[:name],
        :aliases => props[:aliases],
        :description => props[:description],
        :args => props[:args],
        :strict_args => props[:strict_args],
        :use_example => props[:use_example],
        :category => props[:category],
        :user_permissions => props[:user_permissions],
        :client_permissions => props[:client_permissions]
      ]
    end
    private :load_proprieties
  end
end
