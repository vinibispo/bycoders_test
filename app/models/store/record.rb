module Store
  class Record < ApplicationRecord
    self.table_name = 'stores'
    validates :name, presence: true
    validates :owner_name, presence: true
  end
end
