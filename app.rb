require 'sinatra'
require 'sinatra/activerecord'

require_relative 'models/book.rb'
require_relative 'models/review.rb'

get '/' do
    erb :index
end

post '/add-book' do
    @book = Book.create(title: params[:title], author: params[:author])

    if @book.save
        redirect "/books/#{@book.id}"
    else
        erb :index
    end
end

get '/books/:id' do
    @book = Book.find_by(id: params[:id])
    if @book
        erb :book
    else
        redirect '/books'
    end
end

get '/books' do
    @books = Book.order(:created_at)
    erb :books
end

post '/books/edit/:id' do
    @book = Book.find(params[:id])
    erb :edit_book
end

post '/update-book/:id' do
    @book = Book.find(params[:id])
    if @book.update(title: params[:title], author: params[:author])
        redirect "/books/#{params[:id]}"
    else
    erb :edit_book
    end
end

post '/books/delete/:id' do
    @book = Book.find(params[:id])
    @book.destroy
        redirect '/books'
end

get '/books/:id/comment' do
    @book = Book.find(params[:id])
    erb :comment
end

post '/books/:id/comment' do
    @book = Book.find(params[:id])
    @review = Review.create(name: params[:name], content: params[:content], recommended: params[:recommended], book_id: @book.id)
    if @review.save
        redirect "/books/#{params[:id]}"
    else
        erb :comment
    end
end