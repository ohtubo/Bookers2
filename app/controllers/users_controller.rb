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
    #if分をスルーするとどう処理すればいいかわからなくなる
    #同じかどうかを比較するときに.idのみ
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end
    # if
    #   flash[:notice] = ""
    # else
    #   render :
    # end
  private
  # ストロングパラメータ

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :user_id)
  end

end


