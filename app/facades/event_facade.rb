class EventFacade
  def initialize(fields)
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
    service.fetch_events(@fields).map do |event_data|
      Event.new(event_data)
    end
  end
end
