# frozen_string_literal: true

require "rails_helper"

RSpec.describe Enview::Nav::MenuComponent, type: :component do
  let(:item) { Enview::MenuItem.new(label: "Contact", path: "/contact") }

  it "renders a link with the item label and path" do
    rendered = render_inline(described_class.new(menu: item))
    link = rendered.css("a").first

    expect(link.text).to include("Contact")
    expect(link["href"]).to eq("/contact")
  end

  it "adds the active class when the item is active" do
    allow_any_instance_of(described_class).to receive(:active?).and_return(true)

    rendered = render_inline(described_class.new(menu: item))
    link = rendered.css("a").first

    expect(link["class"]).to include("btn-active")
  end
end
