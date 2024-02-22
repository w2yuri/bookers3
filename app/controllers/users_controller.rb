class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  

  def show
    #is_matching_login_user
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
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def update
    is_matching_login_user
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully.You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    @users = User.all
    render :edit
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
 
end