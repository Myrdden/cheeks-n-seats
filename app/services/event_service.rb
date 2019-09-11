class EventService

  def fetch_events(params)
    redis = RedisService.new
    response = redis.get_by(params)
    if !response
      response = parse(fetch('/events', params))
      redis.set_by(params, response)
    end
    return response
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
