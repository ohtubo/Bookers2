class BooksController < ApplicationController

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id　#current_user: ログインユーザーのid情報を渡す。
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # ３. トップ画面へリダイレクト
    redirect_to book_path(@book.id)
  end

  def index
   @user = current_user
   @books = Book.all
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
