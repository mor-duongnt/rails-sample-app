class Profile < ApplicationRecord
  validates :major, presence: true
  validates :skill, presence: true
end
