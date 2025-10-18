# frozen_string_literal: true

module Enview
  module Nav
    # component that renders a menu item
    class MenuComponent < ViewComponent::Base
      def initialize(menu:)
        super()
        @item = menu
      end

      attr_reader :item

      private

      def active?
        helpers.current_page?(item.path)
      end
    end
  end
end
