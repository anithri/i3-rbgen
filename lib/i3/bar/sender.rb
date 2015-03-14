require 'dbus'
require 'json'
module I3
  module Bar
    class Sender

      attr_accessor :bus

      def bus
        @bus ||= DBus.session_bus
      end

      # TODO pull hardcoded names out into ENV or config
      def service
        @service ||= bus.service('com.dubstepdish.i3dstatus')
      end

      def obj
        @obj ||= get_obj
      end

      def show_block(message)
        obj.show_block(message)
      end

      def get_config(name)
        JSON.parse obj.get_config(name).first
      end

      private
      def get_obj
        new_obj ||= service.object('/com/dubstepdish/i3dstatus')
        new_obj.introspect
        new_obj
      end
    end
    SEND_WITH = I3::Bar::Sender.new

  end
end

