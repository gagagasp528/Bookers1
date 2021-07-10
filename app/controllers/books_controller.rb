class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])

  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new
  if  book.save
    flash[:notice] = "Book was successfully created."
     redirect_to book_path(book)
  else
    render :new
  end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    blog.destroy(book_params)
    redirect_to books_path(book)

  end

  private
  def book_parms
    params.require(:book).permit(:title, :body)
  end

end
