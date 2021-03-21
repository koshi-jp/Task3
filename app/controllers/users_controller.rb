class UsersController < ApplicationController
  def index
    @user = current_user
    @book=Book.new
    @users= User.all
  end



  def show
     @user = User.find(params[:id])
  end

  def edit

  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
