require("pry-byebug")
require_relative("models/artist.rb")
require_relative("models/album.rb")

artist1 = Artist.new(
{
  "name" => "Beatles"
})

artist1.save()



binding.pry
nil
