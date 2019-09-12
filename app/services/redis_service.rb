class RedisService
  def initialize
    @redis = Redis.new(host: 'localhost')
    @expiry = 1800 # 30 minutes
  end

  def get_by(params)
    param_string = 'all'
    param_string = stringify(params) if !params.empty?
    @redis.get('eventResult:' + param_string)
  end

  def set_by(params, value)
    param_string = 'all'
    param_string = stringify(params) if !params.empty?
    @redis.setex('eventResult:' + param_string, @expiry, value)
  end

  def stringify(params)
    # This is the most efficient way I swear
    values = params.values
    string = ''
    i = 0
    max = values.count - 1
    while i < max
      string += "#{values[i]},"
      i += 1
    end
    string + values[i]
  end
end
