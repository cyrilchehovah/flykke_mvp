class ChangeSexToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :sex
    add_column :users, :sex, :string,          default: 0,      null: false
  end
end
