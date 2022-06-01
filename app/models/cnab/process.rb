module Cnab
  class Process < Micro::Case
    attribute :cnab
    validates :cnab, presence: true

    KIND_INDEX = 0
    DATE_START_INDEX = 1
    DATE_END_INDEX = 8
    VALUE_START_INDEX = 9
    VALUE_END_INDEX = 18
    CPF_START_INDEX = 19
    CPF_END_INDEX = 29
    CARD_START_INDEX = 30
    CARD_END_INDEX = 41
    HOUR_START_INDEX = 42
    HOUR_END_INDEX = 47
    STORE_OWNER_START_INDEX = 48
    STORE_OWNER_END_INDEX = 61
    STORE_NAME_START_INDEX = 62
    STORE_NAME_END_INDEX = 80

    private_constant :KIND_INDEX,
                     :DATE_START_INDEX,
                     :DATE_END_INDEX,
                     :VALUE_START_INDEX,
                     :VALUE_END_INDEX,
                     :CPF_START_INDEX,
                     :CPF_END_INDEX,
                     :CARD_START_INDEX,
                     :CARD_END_INDEX,
                     :HOUR_START_INDEX,
                     :HOUR_END_INDEX,
                     :STORE_OWNER_START_INDEX,
                     :STORE_OWNER_END_INDEX
    

    def call!
      kind = cnab[0].to_i
      date = cnab[DATE_START_INDEX..DATE_END_INDEX]
      value = cnab[VALUE_START_INDEX..VALUE_END_INDEX]
      cpf = cnab[CPF_START_INDEX..CPF_END_INDEX]
      card = cnab[CARD_START_INDEX..CARD_END_INDEX]
      hour = cnab[HOUR_START_INDEX..HOUR_END_INDEX]
      store_owner = cnab[STORE_OWNER_START_INDEX..STORE_OWNER_END_INDEX]
      store_name = cnab[STORE_NAME_START_INDEX..STORE_NAME_END_INDEX]
      cnab_item = Item.new(kind:, date:, value:, cpf:, card:, hour:, store_owner:, store_name:)
      Success :cnab_processed, result:  { cnab: cnab_item }
    rescue => e
      Failure :error, result: { message: e.message }
    end
  end
end
