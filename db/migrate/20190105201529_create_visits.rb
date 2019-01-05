class CreateVisits < ActiveRecord::Migration[5.2]
  	def change
  		create_table :visits do |t|
	  		t.text :user_name
	  		t.text :phone
	  		t.text :date_time
	  		t.text :barber
	  		t.text :color

	  		t.timestamps
	  	end
	end
end
