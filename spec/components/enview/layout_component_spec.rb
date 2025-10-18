# frozen_string_literal: true

require "rails_helper"

RSpec.describe Enview::LayoutComponent, type: :component do
  let(:menu_items) do
    [
      Enview::MenuItem.new(label: "Projects", path: "/projects"),
      Enview::MenuItem.new(label: "Resume", path: "/resume")
    ]
  end

  around do |example|
    with_request_url "/" do
      example.run
    end
  end

  it "renders brand link and yields content" do
    rendered = render_inline(described_class.new(user: nil, menu_items: menu_items)) { "Hello, components!" }

    brand = rendered.css("a.navbar-brand").first
    expect(brand["href"]).to eq("/")

    expect(rendered.css("main").text).to include("Hello, components!")
  end

  it "renders menu items via the menu component" do
    rendered = render_inline(described_class.new(user: nil, menu_items: menu_items))

    links = rendered.css(".menu a").map(&:text)
    expect(links).to include("Projects", "Resume")
  end

  it "renders language buttons for available locales" do
    rendered = render_inline(described_class.new(user: nil, menu_items: menu_items))

    links = rendered.css("a.language-button")
    expect(links.size).to eq(3)
    texts = links.map(&:text)
    expect(texts).to include("EN", "JA", "DE")
  end

  context "when user is not signed in" do
    it "shows login button linking to sign in" do
      rendered = render_inline(described_class.new(user: nil, menu_items: menu_items))
      login = rendered.css("a.btn.btn-primary").find { |a| a.text.include?("Login") }
      expect(login).to be_present
      expect(login["href"]).to eq("/users/sign_in?locale=en")
    end
  end

  context "when user is signed in" do
    it "shows logout button_to posting to sign out" do
      user = build(:user)
      render_inline(described_class.new(user: user, menu_items: menu_items))

      expect(page).to have_css("form[action='/users/sign_out?locale=en']")
      expect(page).to have_button(I18n.t("menu.logout"))
    end
  end
end
