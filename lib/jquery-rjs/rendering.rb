require 'action_view/helpers'

module ActionView
  module Helpers
    module RenderUpdate
      def render(options = {}, locals = {}, &block)
        if options == :update
          update_page(&block)
        else
          super
        end
      end
    end

    include RenderUpdate
  end
end
