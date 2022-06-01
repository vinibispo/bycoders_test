FactoryBot.define do
  factory :transaction do
    date { "2022-06-01" }
    kind { 1 }
    value { 1.5 }
    cpf { "MyString" }
    card_number { "MyString" }
    hour { "2022-06-01 04:10:11" }
    store { nil }
  end
end
