class UsersController < ApplicationController
  def index
  @users = User.all
  @book = Book.new
  end
  def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
  end
  def edit
   @user = User.find(params[:id])
  end
  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
