require 'rails_helper'
RSpec.describe Cnab::Item do
  describe 'error' do
    it 'should give an exception when not passes any argument ' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'should give an exception when pass invalid kind' do
      instance = described_class.new(kind: 0, date: '20210304', value: 2000, cpf: '48136013835', card: '6666666',
                                     hour: '153453', store_owner: 'Bycoders Store Owner', store_name: 'Bycoders Store')

      expect { instance.normalized_value_with_kind }.to raise_error(NotImplementedError)
    end
  end

  describe 'success' do
    it 'should return all informations allowed' do
      instance = described_class.new(kind: 2, date: '20210304', value: 2000, cpf: '48136013835', card: '6666666',
                                     hour: '153453',
                                     store_owner: 'Bycoders Store Owner', store_name: 'Bycoders Store')

      expect(instance.normalized_value).to eq(20)
      expect(instance.normalized_value_with_kind).to eq(-20)
    end
  end
end
