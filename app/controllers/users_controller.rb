class UsersController < ApplicationController

  def new
  end

  def index
  end

  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end

  def destroy
  end

  private
  # ストロングパラメータ

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
