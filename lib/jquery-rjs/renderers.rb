require 'action_controller/metal/renderers'

module ActionController
  module Renderers
    add :update do |proc, options|
      view_context = self.view_context
      generator = ActionView::Helpers::JqueryHelper::JavaScriptGenerator.new(view_context, &proc)
      self.content_type  = Mime[:js]
      self.response_body = generator.to_s
    end
  end

  module Rendering
    private

    # This method was removed in Rails 7.1, but we need it for render :update to work.
    def _normalize_args(action = nil, options = {}, &blk)
      options = super
      options[:update] = blk if block_given?
      options
    end
  end
end
