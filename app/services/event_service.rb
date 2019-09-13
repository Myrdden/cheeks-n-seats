class EventService

  def self.fetch_events
    response = fetch('/events').body
    while response == '' # This can only end well
      puts "o no"
      response = fetch('/events').body
    end
    return parse(response)
  end

  private
  def self.fetch(uri)
    # Faraday.get("#{ENV['SINATRA_URL']}/api/v1#{uri}")
    Faraday.get("http://localhost:9292/api/v1#{uri}")
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
