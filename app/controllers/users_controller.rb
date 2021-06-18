class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
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
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  # ストロングパラメータ

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :user_id)
  end

end
