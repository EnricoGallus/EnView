# frozen_string_literal: true

module Enview
  class CollectionItemComponent < ViewComponent::Base
    def initialize(record:, datapoints:)
      super()
      @record = record
      @datapoints = datapoints
    end
  end
end
