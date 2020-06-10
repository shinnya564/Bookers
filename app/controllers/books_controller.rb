class BooksController < ApplicationController

	def top

	end

	def index
		@books = Book.all
		#new 処理
		@book = Book.new
	end

	def show
  		@book = Book.find(params[:id])
 	end

	def edit
  		@book = Book.find(params[:id])
	end

	def create
    	@book = Book.new(books_params)
    	@books = Book.all
    	if @book.save
	    	redirect_to book_path(@book), notice:'Book was successfully created.'
	    else
	    	render :index, notice: 'errors prohibited this book from being saved:'
	    end
	end

	def update
    	@book = Book.find(params[:id])
    	if @book.update(books_params)
	    	redirect_to book_path(@book), notice:'Book was successfully updated.'
	    else
	    	render :edit
	    end
	end

	def destroy
 		book = Book.find(params[:id])
    	if book.destroy
	    	redirect_to "/books", notice:'Book was successfully destroyed.'
	    else
	    	render :index
	    end
	end

	private

	def books_params
		params.require(:book).permit(:title,:body)
	end

end
