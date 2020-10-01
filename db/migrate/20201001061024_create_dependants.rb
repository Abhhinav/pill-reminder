class CreateDependants < ActiveRecord::Migration[6.0]
  def change
    create_table :dependants do |t|
      t.string :relationship
      t.string :name
      t.string :email
      t.integer :contact
      t.string :bloodgroup
      t.date :dob
      t.string :weight
      t.string :height

      t.timestamps
    end
  end
end
