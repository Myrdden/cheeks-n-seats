class EventService

  def fetch_events(params)
    redis = RedisService.new
    response = redis.get_by(params)
    if response
      JSON.parse(response, symbolize_names: true)[:events]
    else !response
      response = fetch('/events', params).body
      redis.set_by(params, response)
      parse(response)[:events]
    end
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
