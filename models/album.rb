require('pg')

class Album

  attr_reader :id, :artist_id
  attr_writer :title, :number_of_songs, :genre

   def initialize(options)
     @id = options["id"].to_i
     @title = options["title"]
     @number_of_songs = options["number_of_songs"].to_i
     @genre = options["genre"]
     @artist_id = options["artist_id"].to_i
   end

   def save()
     sql = "INSERT INTO albums (title, number_of_songs, genre, artist_id) VALUES ($1, $2, $3, $4) RETURNING id"
     values = [@title, @number_of_songs, @genre, @artist_id]
     result = SqlRunner.run(sql, values)
     @id = result[0]["id"].to_i
   end

   def self.all()
     sql = "SELECT * FROM albums"
     results = SqlRunner.run(sql)
     results.map {|result| Album.new(result)}
   end

   def self.delete_all()
     sql = "DELETE FROM albums"
     SqlRunner.run(sql)
   end

   def artist()
     sql = "SELECT * FROM artists WHERE id = $1"
     values =[@artist_id]
     artist = SqlRunner.run(sql, values)
     artist_hash = artist[0]
     return Artist.new(artist_hash)
   end

   def edit()
     sql = "UPDATE albums SET (title, number_of_songs, genre) = ($1, $2, $3) WHERE id = $4"
     values = [@title, @number_of_songs, @genre, @id]
     SqlRunner.run(sql, values)
   end
end # end of the class
