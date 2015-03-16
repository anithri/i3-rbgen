require 'pathname'
require_relative './base'
module I3
  module Blocks
    class Load < I3::Blocks::Base
      LOAD_AVG = Pathname.new('/proc/loadavg')

      def tick
        out           = message
        loads         = LOAD_AVG.read.split(/ /) if LOAD_AVG.readable?
        out.name      = name
        out.full_text = format_full_text(loads.take(3))
        out.color     = determine_color(loads)
        out.separator = false

        out
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
