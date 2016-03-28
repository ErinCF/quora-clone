class CreateUsers < ActiveRecord::Migration
	def change
    create_table :users do |columns|
      columns.string :first_name
      columns.string :last_name
      columns.string :email
      columns.string :encrypted_password
      columns.timestamps null:false
    end
	end
end
