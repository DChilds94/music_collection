require("pry-byebug")
require_relative("models/artist.rb")
require_relative("models/album.rb")

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new(
{
  "name" => "Beatles"
})

artist1.save()

artist2 = Artist.new({
  "name" => "Weekend"
  })

  artist2.save()


artist3 = Artist.new({
  "name" => "Bibio"
  })

  artist3.save()

  album1 = Album.new(
    {
      "title" => "The White Album",
      "number_of_songs" => 12,
      "genre" => "rock",
      "artist_id" => artist1.id
    })

    album1.save()

    album2 = Album.new(
      {
      "title" => "My Dear Melancholy",
      "number_of_songs" => 6,
      "genre" => "R&B",
      "artist_id" => artist2.id
      })

      album2.save()

      album3 = Album.new(
        {
          "title" => "Hard Days Night",
          "number_of_songs" => 10,
          "genre" => "Rock",
          "artist_id" => artist1.id
        })

        album3.save()

        album4 = Album.new(
          {
          "title" => "A Mineral Love",
          "number_of_songs" => 13,
          "genre" => "Electronic",
          "artist_id" => artist3.id
          })

          album4.save()

binding.pry
nil
