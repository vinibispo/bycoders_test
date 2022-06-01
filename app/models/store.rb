class Store < ApplicationRecord
  validates :name, presence: true
  validates :owner_name, presence: true
end
