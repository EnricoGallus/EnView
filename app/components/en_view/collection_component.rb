# frozen_string_literal: true

module Enview
  class CollectionComponent < ViewComponent::Base
    renders_many :datapoints, "Datapoint"

    def initialize(model:, collection:)
      super()
      @collection = collection || []
      @model = model
    end

    class Datapoint < ViewComponent::Base
      attr_reader :name, :label

      def initialize(name:, label:)
        @name = name
        @label = label
      end
    end
  end
end
