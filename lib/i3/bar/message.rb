require 'virtus'
require_relative './sender'
require 'json'
module I3
  module Bar
    class Message
      include Virtus.model

      attribute :full_text, String
      attribute :short_text, String
      attribute :color, String
      attribute :min_width, Integer
      attribute :align, String
      attribute :urgent, Boolean
      attribute :name, String
      attribute :instance, String
      attribute :separator, Boolean
      attribute :separator_block_width, Integer

      def to_json
        final = {}
        attributes.each_pair do |k,v|
          next if v.nil?
          final[k.to_s] = v
        end
        final
      end

      def send
        SEND_WITH.show_block(self.to_json)
      end
    end
  end
end
