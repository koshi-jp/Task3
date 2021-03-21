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
     @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def book_params
    params.require(:book).permit(:title, :body,)
  end
end
