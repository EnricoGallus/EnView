# frozen_string_literal: true

require "rails_helper"

RSpec.describe Enview::Nav::LanguageComponent, type: :component do
  around do |example|
    with_request_url "/" do
      example.run
    end
  end

  it "renders language link with attributes and active state for current locale" do
    rendered = render_inline(described_class.with_collection(%i[en ja]))

    links = rendered.css("a.language-button")
    expect(links.size).to eq(2)

    en = links.find { |a| a.text.include?("EN") }
    ja = links.find { |a| a.text.include?("JA") }

    expect(en["href"]).to eq("/en/home")
    expect(en["lang"]).to eq("en")
    expect(en["hreflang"]).to eq("en")
    expect(en["class"]).to include("btn-active")

    expect(ja["href"]).to eq("/ja/home")
    expect(ja["class"]).not_to include("btn-active")
  end
end
