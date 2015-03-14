module I3
  module Blocks
    class Weather < I3::Blocks::Base
      attribute :woesid, Integer

      CONDITION_ICONS = {
          'severe thunderstorms' => '?',
          'thunderstorms' => '?',
          'mixed rain and snow' => '?',
          'mixed rain and sleet' => '?',
          'mixed snow and sleet' => '?',
          'freezing drizzle' => '?',
          'drizzle' => '?',
          'freezing rain' => '?',
          'showers' => '🌧',
          'showers' => '🌧',
          'snow flurries' => '❄',
          'light snow showers' => '❄',
          'blowing snow' => '❄',
          'snow' => '❄',
          'hail' => '🌧',
          'windy' => '🌬',
          'cloudy' => '🌥',
          'mostly cloudy (night)' => '🌥',
          'mostly cloudy (day)' => '🌥',
          'partly cloudy (night)' => '?',
          'partly cloudy (day)' => '?',
          'clear (night)' => '☾',
          'sunny' => '?',
          'fair (night)' => '☾',
          'fair (day)' => '?',
          'hot' => '?',
          'isolated thunderstorms' => '🌩',
          'scattered thunderstorms' => '?',
          'scattered showers' => '',
          'heavy snow' => '❄',
          'scattered snow showers' => '❄',
          'partly cloudy' => '?',
          'thundershowers' => '?',
          'snow showers' => '❄',
          'isolated thundershowers' => '?',
      }
      CONDITION_ICONS.default_proc = ->(h,k) {h[k] = k}

      def tick

      end

      def icon_for_condition(condition)
        CONDITION_ICONS[condition]
      end

    end
  end
end
