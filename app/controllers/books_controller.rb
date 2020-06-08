class BooksController < ApplicationController

	def top

	end

	def index
		@books = Book.all
		#new 処理
		@newbook = Book.new
		book = Book.find(params[:id])
    	book.destroy
    	redirect_to  "http://localhost:3000/books"
	end

	def show
  		@book = Book.find(params[:id])
 	end

	def edit
  		@book = Book.find(params[:id])
	end

	def create
    	book = Book.new(books_params)
    	book.save
    	redirect_to book_path(book.id)
	end

	def update
    	book = Book.find(params[:id])
    	book.update(books_params)
    	redirect_to book_path(book)
	end

	def destroy
 		book = Book.find(params[:id])
    	book.destroy
    	redirect_to book_path
	end

	private

	def books_params
		params.require(:book).permit(:title,:body)
	end

end
