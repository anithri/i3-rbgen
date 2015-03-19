require 'pathname'
require_relative './base'
module I3
  module Blocks
    class Load < I3::Blocks::Base
      attribute :interval, Integer, default: 10
      LOAD_AVG = Pathname.new('/proc/loadavg')

      def call
        loads         = LOAD_AVG.read.split(/ /) if LOAD_AVG.readable?
        full_text = format_full_text(loads.take(3))
        short_text = loads[0]
        color     = determine_color(loads)
        build_message(full_text: full_text, short_text: short_text, color: color)
      end

      def determine_color(loads)
        if loads[0].to_i > 2
          '#FF0000'
        elsif loads[0].to_i > 1
          '#FFFF00'
        else
          nil
        end
      end

      def format_full_text(loads)
        loads.pop if loads[2].to_i < 1
        loads.pop if loads[1].to_i < 0.5
        "[#{loads.join('|')}]"
      end
    end
  end
end
