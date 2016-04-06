class CommentsController < ApplicationController
	
 #http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

 
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)
    redirect_to book_path(@book)
  end

def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book)
end
#goes in show.html.erb

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
