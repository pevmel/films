require 'rails_helper'

RSpec.describe 'admin/movies/index', type: :view do
  before(:each) do
    assign(:movies, [
             Admin::Movie.create!(
               title: 'Title',
               description: 'MyText',
               votes: 2,
               rating: 3.5,
               category: nil
             ),
             Admin::Movie.create!(
               title: 'Title',
               description: 'MyText',
               votes: 2,
               rating: 3.5,
               category: nil
             )
           ])
  end

  it 'renders a list of admin/movies' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
