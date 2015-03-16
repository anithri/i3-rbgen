require 'weather-api'
require_relative 'base'
module I3
  module Blocks
    class Weather < I3::Blocks::Base
      attribute :woeid, Integer, default: 2405641
      attribute :units, String, default: 'c'
      CONDITION_ICONS = {
          'severe thunderstorms' => '🌩',
          'thunderstorms' => '🌩',
          'mixed rain and snow' => '🌧',
          'mixed rain and sleet' => '🌧',
          'mixed snow and sleet' => '🌧',
          'freezing drizzle' => '❄',
          'drizzle' => '🌦',
          'freezing rain' => '❄',
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
          'partly cloudy (night)' => '🌥',
          'partly cloudy (day)' => '🌥',
          'clear (night)' => '☾',
          'sunny' => '🌣',
          'fair (night)' => '☾',
          'fair (day)' => '🌣',
          'fair' => '🌣',
          'hot' => '☀',
          'isolated thunderstorms' => '🌩',
          'scattered thunderstorms' => '🌩',
          'scattered showers' => '🌦',
          'heavy snow' => '❄',
          'scattered snow showers' => '❄',
          'partly cloudy' => '?',
          'thundershowers' => '🌩',
          'snow showers' => '❄',
          'isolated thundershowers' => '🌩',
      }
      CONDITION_ICONS.default_proc = ->(h,k) {h[k] = k}

      def tick
        require 'weather-api'
        response = ::Weather.lookup(woeid, units)
        out = message
        (out.full_text, out.color) = format_result(response)
        out.name = name
        out
      end

      def icon_for_condition(condition)
        CONDITION_ICONS[condition]
      end

      def format_result(response)
        cond = response.condition.text
        temp = response.condition.temp
        cond = "#{icon_for_condition(cond.downcase)} #{temp}#{units.upcase}"
        temp = ((temp * 9/5.0) + 32).to_i if units == 'c'
        color = if temp < 32
                  '#0000FF'
                elsif temp < 80
                  '#00FF00'
                elsif temp < 95
                  '#FFFF00'
                else
                  '#FF0000'
                end
        return [cond, color]
      end

    end
  end
end
