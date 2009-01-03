ActiveRecord::Schema.define do
	create_table :entries, :force => true do |t|
		t.column :image, :string, :null => true
		# I can't figure out why this was set to ":null => false"
		#	many tests don't even use the column so there were as
		# many as 28 MySQL errors saying that the column couldn't
		# be blank.  Therefore, I 'fixed' it.
		t.column :file, :string, :null => true	#false
	end
	
	create_table :movies, :force => true do |t|
		t.column :movie, :string
	end
end
