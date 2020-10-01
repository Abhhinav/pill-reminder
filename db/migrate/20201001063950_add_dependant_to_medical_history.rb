class AddDependantToMedicalHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_histories, :dependant_id, :integer
  end
end
