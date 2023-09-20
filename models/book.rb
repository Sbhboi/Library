class Book < ActiveRecord::Base
    has_many :reviews

    def index
        @books = Book.All
        @reviews = Review.all
    end
end
