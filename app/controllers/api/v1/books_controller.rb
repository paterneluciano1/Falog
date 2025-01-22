module Api
  module V1

    class BooksController < ApplicationController

      def index
        render json: Book.all
      end

      def create
        # We will add the code logic here!
        book = Book.new(book_params)

        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity 
        end
      end

      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
        render json: {}, status: :unprocessable_entity
      end

      private 
        def book_params
          params.require(:book).permit(:title, :author)
        end

    end
  end
end
