require_relative 'sender'
require 'json'
module I3
  module Bar
    module Config
      def self.for(name)
        c = SEND_WITH.get_config(name)
        c['name'] ||= name
        c
      end
    end
  end
end
