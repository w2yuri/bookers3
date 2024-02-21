class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if  @book.save
    redirect_to book_path(@book.id)
  else
    render:index
  end
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
  if @user.save
    flash[:notiece] = "You have updated user successfully.You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    @users = User.all
    render:index
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end 