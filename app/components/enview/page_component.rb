# frozen_string_literal: true

module Enview
  class PageComponent < ViewComponent::Base
    renders_many :header_elements
    renders_many :footer_elements

    def initialize(prefix: nil)
      super()
      @prefix = prefix || ""
    end

    attr_reader :prefix
  end
end
