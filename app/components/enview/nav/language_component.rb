# frozen_string_literal: true

module Enview
  module Nav
    # component that renders a button for switching languages
    class LanguageComponent < ViewComponent::Base
      with_collection_parameter :locale

      def initialize(locale:)
        super()
        @locale = locale.to_sym
      end

      attr_reader :locale

      private

      def label
        I18n.t("menu.language.#{locale}", default: locale.to_s.upcase)
      end

      def active?
        I18n.locale.to_sym == locale
      end
    end
  end
end
