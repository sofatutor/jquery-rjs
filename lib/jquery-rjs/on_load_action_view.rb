require 'action_view/helpers/jquery_helper'
require 'action_view/helpers/jquery_ui_helper'
require 'action_view/template/handlers/rjs'
require 'jquery-rjs/javascript_helper'
require 'jquery-rjs/rendering'

ActionView::Base.class_eval do
  cattr_accessor :debug_rjs
  self.debug_rjs = false
end

ActionView::Base.class_eval do
  include ActionView::Helpers::JqueryHelper
  include ActionView::Helpers::JqueryUiHelper
end





if Rails.env.test?
  Rails.application.reloader.to_prepare do
    # ActionView::TestCase loads all helpers; make sure we delay this after app initialization is done.
    ActionView::TestCase.class_eval do
      include ActionView::Helpers::JqueryHelper
      include ActionView::Helpers::JqueryUiHelper
    end
  end
end

ActionView::Template.register_template_handler :rjs, ActionView::Template::Handlers::RJS.new
