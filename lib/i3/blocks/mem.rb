require_relative './base'
require 'pathname'
module I3
  module Blocks
    class Mem < I3::Blocks::Base
      attribute :interval, Integer, default: 10
      MEM_INFO = Pathname.new('/proc/meminfo')

      def call
        out              = {}
        per, total       = determine_per
        out[:color]      = determine_color(per)
        out[:full_text]  = "#{total}GB @ #{per}%"
        out[:short_text] = "#{per}%"
        build_message(out)
      end

      def determine_per
        meminfo       = MEM_INFO.read().split(/\n/)
        total, active = meminfo[0].strip, meminfo[6].strip
        total         = total.split(/\s+/)[1].to_f
        active        = active.split(/\s+/)[1].to_f

        [(active * 100 / total).round, (total / (1024 * 1024)).round]
      end

      def determine_color(per)
        if per > 90
          '#ff0000'
        elsif per > 75
          '#FFFF00'
        else
          nil
        end
      end

    end
  end
end
