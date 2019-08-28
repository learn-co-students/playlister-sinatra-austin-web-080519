class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :artist_index
    end
end
