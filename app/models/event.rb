class Event
  attr_reader :name, :url, :genre, :venue, :date, :min_price, :max_price
  def initialize(data)
    @name = data[:name]
    @url = data[:url]
    @genre = data[:genre]
    @venue = data[:venue]
    @date = data[:date]
    @min_price = data[:minPrice]
    @max_price = data[:maxPrice]
  end
end
