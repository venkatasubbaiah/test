class ChangeDateOfBirthToUsers < ActiveRecord::Migration
  def up
    change_column :users, :date_of_birth, :date
  end

  def down
    change_column :users, :date_of_birth, :string
  end
end
