require "rails_helper"
require "generators/view_component/enview/enview_generator"

RSpec.describe ViewComponent::Generators::EnviewGenerator, type: :generator do
  destination File.expand_path("../../../dummy/tmp", __FILE__)
  before do
    prepare_destination
  end

  it 'should run all tasks in the generator' do
    gen = generator %w[Post]
    expect(gen).to receive :copy_view_file
    gen.invoke_all
  end

  it "generates component view" do
    output = run_generator %w[Post]

    expect(output).to match(%r{create\s+app/components/post_component\.html\.erb})

    expect(file("app/components/post_component.html.erb")).to exist
  end
end