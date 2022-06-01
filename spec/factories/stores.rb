FactoryBot.define do
  factory :store, class: '::Store::Record' do
    name { "MyString" }
    owner_name { "MyString" }
    value { "9.99" }
  end
end
