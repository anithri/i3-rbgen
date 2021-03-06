require 'virtus'
require_relative 'sender'
require 'json'
module I3
  module Bar
    class Message
      include Virtus.model

      attribute :full_text, String
      attribute :short_text, String
      attribute :color, String
      attribute :min_width, String
      attribute :align, String
      attribute :urgent, Boolean
      attribute :name, String
      attribute :block_instance, String
      attribute :separator, Boolean
      attribute :separator_block_width, Integer
      attribute :markup, String, default: 'pango'

      def to_hash
        final = {}
        attributes.each_pair do |k,v|
          next if v.nil?
          final[k.to_s] = v
        end
        final
      end

      def send
        SEND_WITH.show_block(self.to_hash)
      end
    end
  end
end
