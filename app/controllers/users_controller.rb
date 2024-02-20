class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
 end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :self_introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
 end 