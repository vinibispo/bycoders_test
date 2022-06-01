require 'rails_helper'
RSpec.describe Cnab::Batches::Process do
  context 'success' do
    it 'should process all stuff' do
      result = described_class.call(file_path: file_fixture('cnab.txt'))

      expect(result.success?).to be true
      expect(result.type).to eq(:batches_cnabs)

      expect(result[:transactions]).to be_an_instance_of(Array)
    end
  end

  context 'failure' do
    it 'should give an error when do not pass a empty file_path' do
      result = described_class.call(file_path: '')

      expect(result.failure?).to be true
      expect(result.type).to eq(:invalid_attributes)
    end

    it 'should give an error when do not pass a valid file_path' do
      result = described_class.call(file_path: 'cnab.txt')

      expect(result.failure?).to be true
      expect(result.type).to eq(:error)
    end

    it 'should give an error when pass an invalid cnab' do
      result = described_class.call(file_path: file_fixture('invalid_cnab.txt'))

      expect(result.failure?).to be true
      expect(result.type).to eq(:error)
    end
  end
end
