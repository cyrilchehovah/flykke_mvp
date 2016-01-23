class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :phone_number, :string
    add_column :users, :dob, :date
    add_column :users, :sex, :string
    remove_column :users, :avatar
  end
end
