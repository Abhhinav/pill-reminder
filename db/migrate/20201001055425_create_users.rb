class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :contact
      t.string :country
      t.date :dob
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
