class Genres < ActiveRecord::Migration
  def self.up
  	create_table :genres do |t|
  		t.column :name, :string
  end

  Genre.create :name =>"Science Fiction"
  Genre.create :name =>"Action & Adventure"
  Genre.create :name =>"Romance"
  Genre.create :name =>"Mystery"
  Genre.create :name =>"Self Help"
  Genre.create :name =>"Technology"
end

 	def self.down
      drop_table :genres
   	end
end
