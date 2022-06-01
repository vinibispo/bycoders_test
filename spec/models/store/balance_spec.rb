RSpec.describe Store::Balance do
  context 'success' do
    it 'should return same value from balance' do
      store = create(:store, value: 0)
      create_list(:transaction, 10, value: 30, kind: 1, store_id: store.id)

      balance = described_class.new(store.id)

      expect(balance.value).to eq(300)
    end
  end
end
