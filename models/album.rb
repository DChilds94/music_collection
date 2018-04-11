require('pg')

class Album

   def initialize(options)
     @id = options["id"].to_i
     @title = options["title"]
     @number_of_songs = options["number_of_songs"].to_i
     @artist_id = options["artist_id"].to_i
   end

   def save()
     sql = "INSERT INTO albums (title, number_of_songs, artist_id) VALUES ($1, $2, $3) RETURNING id"
     values = [@title, @number_of_songs, @artist_id]
     result = SqlRunner.run(sql, values)
     @id = result[0]["id"].to_i
   end





end # end of the class
