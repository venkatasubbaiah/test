  class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|	
	t.string :first_name
	t.string :last_name
	t.date :date_of_birth
	t.string :email_address
	t.timestamps
    end
  end
end
