# frozen_string_literal: true

module Enview
  # MenuItem
  class MenuItem
    attr_reader :label, :path

    def initialize(label:, path:)
      @label = label
      @path = path
    end
  end
end
