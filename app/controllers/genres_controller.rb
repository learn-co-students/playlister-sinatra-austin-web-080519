class GenresController < ApplicationController
    get '/genres' do
        @genres = Genre.all
        erb :genre_index
    end
end
