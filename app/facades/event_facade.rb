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
    @_events ||= get_events
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

  def get_events
    events = {}
    service.fetch_events(@fields).each do |event_data|
      if events[event_data[:name]]
        events[event_data[:name]].add_date(event_data[:date], event_data[:url])
      else
        events[event_data[:name]] = Event.new(event_data)
      end
    end
    events.values
  end
end
