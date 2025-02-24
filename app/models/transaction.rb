class Transaction < ApplicationRecord
  belongs_to :store, class_name: '::Store::Record'
  validates :date, presence: true
  validates :value, presence: true
  validates :cpf, presence: true
  validates :card_number, presence: true
  validates :hour, presence: true
end
