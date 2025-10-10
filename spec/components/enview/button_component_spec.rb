require "rails_helper"

RSpec.describe Enview::ButtonComponent, type: :component do
  it "renders" do
    rendered = render_inline(described_class.new(label: "Users", link: "/test"))
    expect(rendered).to have_link(text: "Users", href: "/test")
  end
end
