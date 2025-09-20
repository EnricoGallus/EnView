# frozen_string_literal: true

module EnView
  class ButtonComponent < ViewComponent::Base
    def initialize(label:, link:, scheme: :default, method: :get, data: {})
      super()
      @label = label
      @link = link
      @scheme = scheme
      @method = method
      @as = @method == :get ? :link : :button
      @data = data
      @data[:turbo_confirm] = I18n.t("ui.delete_confirm") if @method == :delete
    end

    private

    def classes
      parts = []
      parts << "inline-flex items-center gap-2 rounded-md font-medium"
      parts << case @scheme
      when :primary then "btn btn-primary"
      when :error  then "btn btn-error"
      when :ghost   then "text-gray-900 bg-transparent hover:bg-gray-50"
      when :default then "btn btn-default"
      else               "text-gray-900 bg-gray-100 hover:bg-gray-50"
      end
      parts.join(" ")
    end
  end
end
