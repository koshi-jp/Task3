class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users= User.all

  end

  def show
    @user = User.find(params[:id])
    @books= @user.books
    @book = Book.new

  end

  def edit
     @user = User.find(params[:id])
     unless current_user == @user
     redirect_to user_path(current_user)
     end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:notice] = 'You have update user info successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
