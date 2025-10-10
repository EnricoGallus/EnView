require "rails_helper"
require "generators/enview/scaffold/scaffold_generator"

RSpec.describe Enview::Generators::ScaffoldGenerator, type: :generator do
  destination File.expand_path("../../../dummy/tmp", __FILE__)
  before do
    prepare_destination
  end

  it 'should run all tasks in the generator' do
    gen = generator %w[Post title:string body:text]
    expect(gen).to receive :ensure_pundit_installed
    expect(gen).to receive :generate_pundit_policy
    gen.invoke_all
  end

  it "generates componentized scaffold views" do
    output = run_generator %w(Post title:string body:text)

    expect(output).to match(%r{create\s+app/views/posts/index\.html\.erb})
    expect(output).to match(%r{create\s+app/views/posts/_form\.html\.erb})

    expect(file("app/views/posts/index.html.erb")).to exist
    expect(file("app/views/posts/_form.html.erb")).to contain(/form_with/)
    expect(file("app/views/posts/new.html.erb")).to exist
    expect(file("app/views/posts/edit.html.erb")).to exist
    expect(file("app/views/posts/show.html.erb")).to exist
  end

  describe 'the generated files' do
    before do
      run_generator %w(Post title:string body:text)
    end

    describe 'the index page' do
      subject { file('app/views/posts/index.html.erb') }

      it { is_expected.to exist }
      it { is_expected.to contain(/Enview::PageComponent\.new\(prefix: "post\.index\."\)/) }
    end
  end
end