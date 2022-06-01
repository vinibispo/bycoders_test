require 'rails_helper'

RSpec.describe Store::Record, type: :model do
  context 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:owner_name) }
  end
end
