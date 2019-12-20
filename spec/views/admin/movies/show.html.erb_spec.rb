require 'rails_helper'

RSpec.describe "admin/movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Admin::Movie.create!(
      :title => "Title",
      :description => "MyText",
      :votes => 2,
      :rating => 3.5,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(//)
  end
end
