class AddUserToDependant < ActiveRecord::Migration[6.0]
  def change
    add_column :dependants, :user_id, :integer
  end
end
