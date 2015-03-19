require_relative './base'
module I3
  module Blocks
    class Clock < I3::Blocks::Base

      attribute :clock_format, String, default: '%Y-%m-%d %H:%M'
      attribute :interval, Integer, default: 60
      def call
        build_message(full_text: Time.now.strftime(clock_format))
      end


    end
  end
end
