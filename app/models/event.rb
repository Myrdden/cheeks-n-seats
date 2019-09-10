class Event
  attr_reader :name, :url, :genre, :venue, :dates, :min_price, :max_price
  def initialize(data)
    @name = data[:name]
    @url = data[:url]
    @genre = data[:genre]
    @venue = data[:venue]
    @dates = [data[:date]]
    @min_price = data[:minPrice]
    @max_price = data[:maxPrice]
  end

  def add_date(date, url)
    @dates << date.merge({url: url})
  end

  Months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  def self.datify(datetime)
    date = datetime[:date].split('-')
    time = datetime[:time].split(':')
    "#{date[2]} #{Months[date[1].to_i]}, #{date[0]} @ #{time[0]}:#{time[1]} (#{datetime[:status].capitalize})"
  end
end
