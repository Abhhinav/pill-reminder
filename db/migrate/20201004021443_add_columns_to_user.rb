class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bloodgroup, :string
    add_column :users, :weight, :string
    add_column :users, :height, :string
  end
end
