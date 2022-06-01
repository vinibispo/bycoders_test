module Cnab
  DEBIT = 1
  BILLET = 2
  FINANCING = 3
  CREDIT = 4
  RECIEVING_LOAN = 5
  SALES = 6
  TED_RECEIPT = 7
  DOC_RECEIPT = 8
  RENT = 9
  Item = ::Micro::Struct.with(:readonly).new(:kind, :date, :value, :cpf, :card, :hour, :store_owner, :store_name) do
    def normalized_value
      value / 100.00
    end

    def normalized_value_with_kind
      factor = 0
      factor = 1 if [DEBIT, CREDIT, RECIEVING_LOAN, SALES, TED_RECEIPT, DOC_RECEIPT].include?(kind)
      factor = -1 if [BILLET, FINANCING, RENT].include?(kind)
      raise NotImplementedError if factor.zero?

      factor * normalized_value
    end
  end
end
