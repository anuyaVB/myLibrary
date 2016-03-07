class Genre < ActiveRecord::Base
	has_many :books
	#We have used plural books here, because one genre can have multiple books.
end

