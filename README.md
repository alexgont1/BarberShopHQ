# new version of BarberShop
#IMPORTANT***************************************
#commands to work with ActiveRecord (data bases):
#1. rake db:create_migration NAME=name_of_migration (create new table). Example: rake db:create_migration NAME=clients
#in each migration file (/migrate folder) add commands for table, example:
#def change
#	create_table :visits do |t|
#		t.text :name
#		t.text :phone
#
#		t.timestamps
#	end
#end
#2. rake db:migrate (finish new table creation)
#3. rake db:rollback (return to previous migration)