# frozen_string_literal: true

module EnView
  class NameValueComponent < ViewComponent::Base
    def initialize(label:, value:)
      super()
      @label = label
      @value = value
    end
  end
end
