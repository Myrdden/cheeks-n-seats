class GenreList
  attr_reader :genres

  def initialize(data)
    @genres = data[:name]
  end
end
