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
    # redis = RedisService.new
    # events = redis.get_by(@fields)
    # if !events
      events = EventService.fetch_events
    #   update = true
    # else
    #   events = JSON.parse(events, symbolize_names: true)
    # end
    events.each do |event_data|
      if response[event_data[:name]]
        response[event_data[:name]].add_date(event_data[:date], event_data[:time], event_data[:url])
      else
        response[event_data[:name]] = Event.new(event_data)
      end
    end
    response = response.values
    # response = filter(response, @fields) if !@fields.empty?
    # redis.set_by(@fields, response.to_json) if update
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
    events.keep_if do |event|
      valid = true
      params.each do |k,v|
        case k
        when 'minPrice'
          if event.min_price >= v.to_f
            valid = false
            p "#{event.min_price} >= #{v.to_f}"
          end
        when 'maxPrice'
          if event.max_price <= v.to_f
            valid = false
            p "#{event.max_price} <= #{v.to_f}"
          end
        when 'date'
          # if !event.dates.any? {|date| match_date(date[:date], v)}
          #   valid = false
          #   p 
          # end
        end
      end
      p valid
      valid
    end
  end

  def match_date(event, param)
    month_nums = {'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4,
                  'May' => 5, 'Jun' => 6, 'Jul' => 7, 'Aug' => 8,
                  'Sep' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12}
    event_date = event.split('-')
    param_date = param.split(' ')
    param_date[0] = month_nums[param_date[0]]
    param_date[1] = param_date[1].delete(',')
    event_date[0] == param_date[2] && event_date[1] == param_date[0] && event_date[2] == param_date[1]
  end
end
