class Book < ActiveRecord::Base
	belongs_to :genre
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_presence_of :bookname
	validates_presence_of :author
	belongs_to :user
	
	#used a singular genre in the above example, because one Book can belong to a single Genre.
end
