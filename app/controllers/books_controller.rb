class BooksController < ApplicationController
	
#http_basic_authenticate_with name: "admin", password: "admin", except: [:list, :show]
before_action :authenticate_user! , except: [:list, :show]


	def index
	end
	layout 'standard'
	
	def list
		@user=User.new
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

	def edit
		@book=Book.find(params[:id])
		@genres=Genre.all
	end


	def create
		@book=Book.new(book_params)
		

		if @book.save
			redirect_to :action => 'list'
		else
			@genres=Genre.all
			render :action =>'new'
		end
	end
	def book_params
		params.require(:book).permit(:bookname, :author, :genre_id, :description, :image)
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
	def book_param
		params.require(:book).permit(:bookname, :author, :genre_id, :description, :image)
	end

	def delete
		Book.find(params[:id]).destroy
		redirect_to :action=>'list'
	end

	def show_genres
      @genre = Genre.find(params[:id])
    end	
end
