require_relative './base'
module I3
  module Blocks
    class Mem < I3::Blocks::Base
      MEM_INFO = Pathname.new('/proc/meminfo')

      def tick
        out           = message
        per           = determine_per
        out.color     = determine_color(per)
        out.full_text = determine_text(per)
        out.separator = false
        out.name      = name
        out
      end

      def determine_per
        meminfo       = MEM_INFO.read().split(/\n/)
        total, active = meminfo[0].strip, meminfo[6].strip
        total         = total.split(/\s+/)[1].to_f
        active        = active.split(/\s+/)[1].to_f

        (active  * 100 / total).round
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

      def determine_text(per)
        case
          when per > 90
            "┤𝍭 #{per}%├"
          when per > 70
            "┤𝍬 #{per}%├"
          when per > 50
            "┤𝍫 #{per}%├"
          when per > 30
            "┤𝍪 #{per}%├"
          else
            "┤𝍩 #{per}%├"
        end
      end
    end
  end
end
