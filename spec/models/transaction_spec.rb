require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'attributes' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:card_number) }
    it { should validate_presence_of(:hour) }
  end

  context 'associations' do
    it { should belong_to(:store) }
  end
end
