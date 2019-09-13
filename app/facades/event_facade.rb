class EventFacade
  attr_reader :priceMin, :priceMax, :date

  def initialize(fields)
    @priceMin = fields[:minPrice]
    @priceMax = fields[:maxPrice]
    @date = fields[:date]
    unneeded = ['utf8', 'controller', 'action', 'commit']
    @fields = {}
    fields.reject! {|key| unneeded.include?(key)}.each do |k, v|
      @fields[k] = v
    end
  end

  def events
    response = {}
    update = false
    redis = RedisService.new
    events = redis.get_by(@fields)
    if !events
      events = EventService.fetch_events
      update = true
    else
      events = JSON.parse(events, symbolize_names: true)
    end
    events.each do |event_data|
      if response[event_data[:name]]
        response[event_data[:name]].add_date(event_data[:date], event_data[:time], event_data[:url])
      else
        response[event_data[:name]] = Event.new(event_data)
      end
    end
    response = response.values
    #response = filter(response, @fields) if !@fields.empty?
    redis.set_by(@fields, response.to_json) if update
    return response
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

  def filter(events, params)
    
  end
end
