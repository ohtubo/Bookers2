class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #current_user: ログインユーザーのid情報を渡す。
    @book.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行

    # ３. トップ画面へリダイレクト
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      #index_book
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
   @book = Book.new
   @user = current_user
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    #データがからの場合クリエイト、埋まっている場合update
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
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
