class Dependant < ApplicationRecord
  belongs_to :user
  has_many :medical_histories
end
