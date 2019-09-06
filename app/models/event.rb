class Event
  attr_reader :name, :url, :genre, :venue, :date
  def initialize(data)
    @name = data[:name]
    @url = data[:url]
    @genre = data[:genre]
    @venue = data[:venue]
    @date = data[:date]
  end
end
