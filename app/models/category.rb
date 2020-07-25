class Category < ApplicationRecord
  validates :name, :ancestry, :id,  presence: true
  has_ancestry
  has_many :items
end
