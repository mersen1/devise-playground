module Devise
  module Models
    module RedisAuthenticatable
      extend ActiveSupport::Concern

      module ClassMethods
        def serialize_from_session(key)
          redis_conn = Redis.new
          attributes = redis_conn.mapped_hmget(key, self.attribute_names)

          return if attributes.blank?

          self.new(attributes)
        end

        def serialize_into_session(record)
          [record.key]
        end
      end
    end
  end
end
