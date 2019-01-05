class Contacts < ActiveRecord::Migration[5.2]
 	def change
  	  	create_table :contacts do |t|
	  		t.text :user_name
	  		t.text :date_time

	  		t.timestamps
	  	end
  	end
end
