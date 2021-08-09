class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(book.user)
  end

  def index
    @books = Book.all
    @book = Book.new
    redirect_to book_path(book.user)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.new
    redirect_to user_path
  end

  def update
   @book = Book.find(params[:id])
   @book.update(book_params)
   redirect_to user_path
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
