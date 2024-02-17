class BooksController < ApplicationController
  def show
  end
  
  def create
    @book = Book.new(bookparams)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
