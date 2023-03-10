class AddColumnstoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :admin_user, :boolean
  end
end
