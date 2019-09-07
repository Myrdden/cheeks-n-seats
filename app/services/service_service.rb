class ServiceService
  def self.events_by_city(city)
    parse(fetch('/events', {city: city})).map! do |event_data|
      Event.new(event_data)
    end
  end

  private
  def self.fetch(uri, params)
    Faraday.get("http://localhost:9393/api/v1#{uri}") do |req|
      req.params = params
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end