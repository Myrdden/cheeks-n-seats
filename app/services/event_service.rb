class EventService

  def fetch_events(params)
    redis = RedisService.new
    response = redis.get_by(params)
    if !response
      response = fetch('/events', params).body
      while response == '' # This can only end well
        response = fetch('/events', params).body
      end
      redis.set_by(params, response)
    end
    return parse(response)
  end

  private
  def fetch(uri, params)
    Faraday.get("http://localhost:9393/api/v1#{uri}") do |req|
      req.params = params
    end
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
