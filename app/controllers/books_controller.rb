class BooksController < ApplicationController
  def index
    @user = current_user
    @books=Book.all
    @book=Book.new
    @user_id = @book.user
  end

  def create
    book=Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def new
    @book=Book.new
  end

  def show
    @book_new=Book.new
    @book=Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    if @book.destroy
      redirect_to books_path, notice: 'successfully destroy'
    end
  end
  # book=Book.new(book_params)
  #   book.user_id = current_user.id
  #   book.save
  #   redirect_to book_path(book.id)

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end