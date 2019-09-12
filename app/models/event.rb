class Event
  attr_reader :name, :genre, :venue, :dates, :min_price, :max_price
  def initialize(data)
    @name = data[:name]
    @genre = data[:genre]
    @venue = data[:venue]
    @dates = [{date: data[:date], time: data[:time], url: data[:url]}]
    @min_price = data[:minPrice]
    @max_price = data[:maxPrice]
  end

  def add_date(date, time, url)
    @dates << {date: date, time: time, url: url}
  end

  Months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  def self.datify(datetime)
    date = datetime[:date].split('-')
    time = datetime[:time].split(':')
    "#{date[2]} #{Months[date[1].to_i - 1]}, #{date[0]} @ #{time[0]}:#{time[1]}"
  end
end
