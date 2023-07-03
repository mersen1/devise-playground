module Devise
  module Strategies
    class RedisAuthenticatable < Authenticatable
      def authenticate!
      end
    end
  end
end

Warden::Strategies.add(:redis_authenticatable, Devise::Strategies::RedisAuthenticatable)
