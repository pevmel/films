require 'rails_helper'

RSpec.describe "admin/movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Admin::Movie.create!(
      :title => "MyString",
      :description => "MyText",
      :votes => 1,
      :rating => 1.5,
      :category => nil
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[votes]"

      assert_select "input[name=?]", "movie[rating]"

      assert_select "input[name=?]", "movie[category_id]"
    end
  end
end
