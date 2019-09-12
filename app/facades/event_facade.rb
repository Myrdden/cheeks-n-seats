class EventFacade
  attr_reader :priceMin, :priceMax, :date

  def initialize(fields)
    @priceMin = fields[:minPrice]
    @priceMax = fields[:maxPrice]
    @date = fields[:date]
    @fields = fields
    @service = EventService.new
  end

  def events
    response = {}
    service.fetch_events(@fields).each do |event_data|
      if response[event_data[:name]]
        response[event_data[:name]].add_date(event_data[:date], event_data[:time], event_data[:url])
      else
        response[event_data[:name]] = Event.new(event_data)
      end
    end
    response.values
  end

  def genres
    all_genres = events.map do |event|
      event.genre
    end
    all_genres.uniq.map do |genre|
      [genre, genre]
    end
  end

  private

  attr_reader :service
end
