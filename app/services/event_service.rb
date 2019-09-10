class EventService

  def fetch_events(fields)
    parse(fetch('/events', fields))
  end

  private
  def fetch(uri, params)
    Faraday.get("http://localhost:9292/api/v1#{uri}") do |req|
      req.params = params
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
