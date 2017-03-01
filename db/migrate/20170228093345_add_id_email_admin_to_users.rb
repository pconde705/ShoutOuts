class AddIdEmailAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :school, foreign_key: true
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
