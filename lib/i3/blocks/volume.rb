require_relative 'base'
module I3
  module Blocks
    class Volume < I3::Blocks::Base
      attribute :sink, Integer, default: 0
      PACTL = 'pactl list sinks'

      def call
        out              = {}
        vol              = get_current_volume
        out[:short_text] = vol.to_s
        out[:full_text]  = if vol.nil?
                             '🔇'
                           elsif vol < 40
                             "🔈#{vol}%"
                           elsif vol < 80
                             "🔉#{vol}%"
                           else
                             "🔊#{vol}%"
                           end
        build_message(out)
      end


      def get_current_volume
        result  = `#{PACTL}`
        my_sink = result.split(/\n\n/)[sink].split(/\n/)
        return nil if my_sink[8].include? 'Mute: yes'
        /\s+(\d{1,3})%/.match(my_sink[9])[0].to_i
      end
    end
  end
end

