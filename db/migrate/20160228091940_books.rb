class Books < ActiveRecord::Migration
 
		def self.up
			create_table :books do |t|
				t.string :bookname 
				t.string :author
				t.integer :genre_id
				
				t.text :description
				
				t.timestamps null: false
			end
		end

		def self.down
      		drop_table :books
  		end
end
