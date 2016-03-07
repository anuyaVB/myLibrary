class BooksController < ApplicationController
	def index
	end
	layout 'standard'
	
	def list
		@genres=Genre.all
		@books = Book.all
	end

	def show
		@book=Book.find(params[:id])
	end

	def new
		@book=Book.new
		@genres=Genre.all
	end

	def create
		@book=Book.new(book_params)

		if @book.save
			redirect_to :action =>'list'
		else
			@genres=Genre.all
			render :action =>'new'
		end
	end

	def edit
		@book=Book.find(params[:id])
		@genres=Genre.all
	end

	def update
		@book=Book.find(params[:id])

		if @book.update_attributes(book_param)
			redirect_to :action =>'show', :id=>@book
		else 
			@genres=Genre.all
			render :action =>'edit'
		end
	end

	def delete
		Book.find(params[:id]).destroy
		redirect_to :action=>'list'
	end

	def show_genres
      @genre = Genre.find(params[:id])
    end

		
	

	 def book_params
		params.require(:books).permit(:bookname, :author, :genre_id, :image, :description)
	end

	def book_param
		params.require(:book).permit(:bookname, :author, :genre_id, :image, :description)
	end
end
