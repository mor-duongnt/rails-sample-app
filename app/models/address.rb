class Address < ApplicationRecord
  validates :name, presence: true
  validates :note, presence: true
end
