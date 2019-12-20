require 'rails_helper'

RSpec.describe "admin/movies/new", type: :view do
  before(:each) do
    assign(:movie, Admin::Movie.new(
      :title => "MyString",
      :description => "MyText",
      :votes => 1,
      :rating => 1.5,
      :category => nil
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[votes]"

      assert_select "input[name=?]", "movie[rating]"

      assert_select "input[name=?]", "movie[category_id]"
    end
  end
end
