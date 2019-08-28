class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
    end

    create_table :songs do |s|
      s.string :name
      s.integer :artist_id
    end

    create_table :genres do |g|
      g.string :name
    end

    create_table :song_genres do |sg|
      sg.integer :song_id
      sg.integer :genre_id
    end

  end
end
