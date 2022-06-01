module Store
  class Balance
    attr_reader :store_id

    def initialize(store_id)
      @store_id = store_id
    end

    def value
      Transaction.where(store_id:).sum('value') + Store::Record.find_by(id: store_id).value
    end
  end
end
