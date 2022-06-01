module Cnab
  class Batches::Process < ::Micro::Case
    attribute :file_path, validates: { presence: true }
    ToStoreId = lambda do |item|
      store = Store::Record.find_by(name: item.store_name)
      return store.id if store.present?

      Store::Record.create!(name: item.store_name, owner_name: item.store_owner).id
    end

    ToModel = lambda do |item|
      {
        kind: item.kind, date: item.date.to_date,
        value: item.normalized_value_with_kind,
        cpf: item.cpf,
        card_number: item.card,
        hour: Time.at(item.hour.to_i).strftime('%H:%M'),
        store_id: ToStoreId[item]
      }
    end

    private_constant :ToStoreId, :ToModel

    def call!
      file = File.open(file_path)


      parsed_data = file.readlines.map(&:chomp).map do |row|
        item = Process.call(cnab: row)
        ToModel[item[:cnab]]
      end

      records = create_records(parsed_data)

      Success :batches_cnabs, result: { transactions: records }
    rescue StandardError => e
      Failure :error, result: { message: e.message }
    end

    private

    def create_records(items = [])
      records = []
      Transaction.transaction do
        records = Transaction.create(items)
      rescue ActiveRecord::RecordInvalid
        raise ActiveRecord::Rollback
      end

      records
    end
  end
end
