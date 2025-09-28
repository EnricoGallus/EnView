# frozen_string_literal: true

module Enview
  class CollectionItemComponent < ViewComponent::Base
    def initialize(record:, datapoints:, namespaces: [])
      super()
      @record = record
      @datapoints = datapoints
      @scope = namespaces + [ record ]
    end
  end
end
