# frozen_string_literal: true

module Enview
  class PageComponent < ViewComponent::Base
    renders_many :headers
    renders_one :body
    renders_many :footers

    def initialize(prefix: nil)
      super()
      @prefix = prefix || ""
    end

    attr_reader :prefix
  end
end
