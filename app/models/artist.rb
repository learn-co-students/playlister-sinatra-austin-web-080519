class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

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