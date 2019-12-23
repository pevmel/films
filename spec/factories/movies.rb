FactoryBot.define do
  factory :movie, class: 'Movie' do
    title { 'MyString' }
    description { 'MyText' }
    votes { 1 }
    rating { 1.5 }
    category { nil }
  end
end
