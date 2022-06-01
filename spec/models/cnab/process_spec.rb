require 'rails_helper'
RSpec.describe Cnab::Process do
  describe 'failures' do
    it 'should return failure when there is no attributes' do
      result = described_class.call

      expect(result.failure?).to be true
      expect(result.type).to eq(:invalid_attributes)
    end
  end

  describe 'success' do
    it 'should return processed data' do
      cnab = "3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       "

      result = described_class.call(cnab:)

      expect(result.type).to eq(:cnab_processed)
      expect(result.success?).to be true
      expect(result.data[:cnab]).not_to be_nil
    end
  end
end
