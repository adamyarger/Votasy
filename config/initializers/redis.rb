uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
ENV["REDIS_URL"] = ENV["REDISTOGO_URL"]

# uri = URI.parse(ENV['redis://redistogo:ef6a614bb7ad25506f16b8df0a1b56e8@catfish.redistogo.com:9809/'] || "redis://localhost:6379/")
# REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)