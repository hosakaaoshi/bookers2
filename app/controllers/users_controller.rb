class UsersController < ApplicationController
  def index
  @users = User.all
  @new_book = Book.new
  end
  def show
  @user = User.find(params[:id])
  @new_book = Book.new
  @books = @user.books
  end
  def edit
   @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
