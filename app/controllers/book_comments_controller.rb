class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
      # Ajax用のレスポンスを返す
      respond_to do |format|
        format.js   # create.js.erb を探す
        format.html { redirect_to book_path(@book) }
      end
    else
      respond_to do |format|
        format.html { redirect_to book_path(@book), alert: "Error" }
      end
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book = @book_comment.book
    @book_comment.destroy
    respond_to do |format|
      format.js   # destroy.js.erb を探す
      format.html { redirect_to book_path(@book) }
    end
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
