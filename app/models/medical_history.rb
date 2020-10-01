class MedicalHistory < ApplicationRecord
  belongs_to :user
  belongs_to :dependant, optional: true
end
