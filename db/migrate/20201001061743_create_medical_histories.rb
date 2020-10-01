class CreateMedicalHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_histories do |t|
      t.string :illness
      t.string :drname
      t.string :medicine
      t.date :startdate
      t.date :enddate
      t.string :dosage_amount
      t.string :dosage_frequency
      t.time :dosage_time
      t.boolean :email_notify

      t.timestamps
    end
  end
end
