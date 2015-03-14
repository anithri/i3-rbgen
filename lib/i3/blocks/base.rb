require 'virtus'
require_relative '../bar/message'

module I3
  module Blocks
    class Base
      include Virtus.model

      attribute :name, String, default: ''
      attribute :interval, Integer, default: 5
      attribute :options, Hash[String => String], default: {}

      def message
        I3::Bar::Message.new(options)
      end

      def tick
        raise NotImplementedError.new('tick is not implemented')
      end
    end
  end
end
