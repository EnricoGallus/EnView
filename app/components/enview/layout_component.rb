# frozen_string_literal: true

module Enview
  # initialized in layout and sets navigation, content and menu
  class LayoutComponent < ViewComponent::Base
    renders_one :nav_start
    renders_one :nav_end

    def initialize(user:, menu_items:)
      super()
      @user = user
      @menu_items = menu_items
    end

    attr_reader :menu_items

    private

    def signed_in?
      @user.present?
    end
  end
end
