class City < ApplicationRecord
  validates :name, :zip_codem presence: true 
  has_many: users
end
