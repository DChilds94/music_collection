require("pg")

require_relative("album.rb")
require_relative("../db/sql_runner.rb")

class Artist

  attr_reader :id
  attr_writer :name

  def initialize(options)
    @id = options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    name = SqlRunner.run(sql, values)
    @id = name[0]["id"].to_i
  end


end
