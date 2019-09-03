class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        downcase = self.name.downcase
        split = downcase.split(" ")
        split.join("-")        
    end

    def self.find_by_slug(slug)
        name_array = slug.split("-")
        new_name_array = name_array.map {|n| n.capitalize}
        name_string = new_name_array.join(" ")
        self.find_by(name: name_string)
    end
    
end