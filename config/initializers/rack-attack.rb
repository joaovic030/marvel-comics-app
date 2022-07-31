# config/initializers/rack_attack.rb

class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('req/ip', limit: 15, period: 1.minutes) do |req|
    req.ip
  end

  # class Request < ::Rack::Request
  #   def subdomain
  #     host.split('.').first
  #   end
  # end
end
