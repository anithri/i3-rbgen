require_relative './base'
module I3
  module Blocks
    class Clock < I3::Blocks::Base

      attribute :format, String, default: '%Y-%m-%d %H:%M'

      def tick
        out = message
        out.full_text = Time.now.strftime(self.format)
        out.name = 'clock'
        out
      end
    end
  end
end
