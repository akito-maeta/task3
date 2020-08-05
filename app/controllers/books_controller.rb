class BooksController < ApplicationController

before_action :authenticate_user!
before_action :correct_book, only: [:edit]

  def new
	  @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
    redirect_to book_path(@book), notice: 'You have creatad book successfully.'
    else
    redirect_to books_path, alert: "Some errors occured"
    end
  end

  def index
    @book = Book.new
  	@books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new

  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have creatad book successfully.'
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    book = Book.find(params[:id])
    if book.user != current_user
    redirect_to books_path
    end
  end

end