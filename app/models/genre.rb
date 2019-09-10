class GenreList
  attr_reader :genres

  def initialize(data)
    @genres = data[:genres]
  end
end
