class BooksController < ApplicationController

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id#current_user: ログインユーザーのid情報を渡す。
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # ３. トップ画面へリダイレクト
    redirect_to book_path(@book)
  end

  def index
   @book = Book.new
   @user = current_user
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
