class BooksController < ApplicationController

  before_action :ensure_user, only: [:edit]

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
   if  @new_book.save
    redirect_to book_path(@new_book),  notice:'successfully'
   else
    @books = Book.all
    render :index
   end

  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book),  notice:'successfully'
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

  def ensure_user
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end
end
