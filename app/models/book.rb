class Book < ActiveRecord::Base
	belongs_to :genre
	#used a singular genre in the above example, because one Book can belong to a single Genre.
end
