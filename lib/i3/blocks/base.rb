require_relative '../bar/message'

module I3
  module Blocks
    class Base
      include Virtus.model

      attribute :name, String

      def message_options
        @message_options ||= {
            name: name,
        }
      end

      def build_message(msg_options = {})
        I3::Bar::Message.new(message_options.merge(msg_options))
      end

      def tick
        raise NotImplementedError.new('tick is not implemented')
      end
    end
  end
end
