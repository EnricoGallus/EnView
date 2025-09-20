require "test_helper"
require "en_view/generators/scaffold/scaffold_generator"

module Enview
  class ScaffoldGeneratorTest < Rails::Generators::TestCase
    tests EnView::Generators::ScaffoldGenerator
    destination Rails.root
    setup :prepare_destination

    test "creates a model file with proper class" do
      run_generator %w[Category name:string description:text]
      assert_file "app/models/category.rb", /class Category < ApplicationRecord/
    end

    test "creates a controller file with proper class" do
      run_generator %w[Category name:string description:text]
      assert_file "app/controllers/categories_controller.rb" do |content|
        assert_match(/class CategoriesController < ApplicationController/, content)
      end
    end

    test "creates views" do
      run_generator %w[Category name:string description:text]
      assert_file "app/views/categories/index.html.erb"
      assert_file "app/views/categories/show.html.erb"
    end
  end

end
