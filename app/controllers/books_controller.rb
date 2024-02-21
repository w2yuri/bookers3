class BooksController < ApplicationController
  def post
  end

  def show
  @book = Book.find(params[:id])
  @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if  @book.save
    flash[:notiece] = "You have created book successfully."
    redirect_to book_path(@book.id)
  else
    @user = current_user
    @books = Book.all
    render:index
  end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @user = current_user
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notiece] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    render :edit
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end