require 'pry'
class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :song_index
    end

    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all
        erb :new_song
    end

    post '/songs' do
        if !params["artist_name"].empty?
            if Artist.all.include?(Artist.all.find{|artist| artist.name == params["artist_name"]})
                new_artist = Artist.all.find{|artist| artist.name == params["artist_name"]}
            else
                new_artist = Artist.create(name: params["artist_name"])
            end
            new_song = Song.create(name: params["Name"], artist_id: new_artist.id)
        else
            new_song = Song.create(name: params["Name"], artist_id: params["artist_id"].to_i)
        end
        new_song.genres << Genre.find(params["genre_id"])
        new_song.save
        redirect to "/songs/#{new_song.slug}"
    end


    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :song_show
    end


    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :edit_song
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        if !params["artist_name"].empty?
            if Artist.all.include?(Artist.all.find{|artist| artist.name == params["artist_name"]})
                new_artist = Artist.all.find{|artist| artist.name == params["artist_name"]}
            else
                new_artist = Artist.create(name: params["artist_name"])
            end
            @song.artist = new_artist
        end
        
        if !(params["genre_id"] == nil)
            genre_array = params["genre_id"].map {|genre_id| Genre.find(genre_id)}
            @song.genres = genre_array
        end
        @song.save

        redirect to "/songs/#{@song.slug}"
    end


end
