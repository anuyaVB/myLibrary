class Books < ActiveRecord::Migration
 
		def self.up
			create_table :books do |t|
				t.column :bookname, :string, :limit =>32, :null =>false
				t.column :author, :string
				t.column :genre_id, :integer
				t.column :image, :binary
				t.column :description, :text
				t.timestamps null: false
			end
		end

		def self.down
      		drop_table :books
  		end
end
