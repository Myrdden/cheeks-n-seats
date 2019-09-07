class ServiceService

  def self.events_by_city(city)
    parse(fetch('/events', {city: city})).map! do |event_data|
      Event.new(event_data)
    end
  end

  def self.events_filtered(fields)
    parse(fetch('/events', fields)).map! do |event_data|
      Event.new(event_data)
    end
  end

  private
  def self.fetch(uri, params)
    Faraday.get("http://localhost:9292/api/v1#{uri}") do |req|
      req.params = params
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
