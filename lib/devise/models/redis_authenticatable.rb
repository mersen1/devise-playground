module Devise
  module Models
    module RedisAuthenticatable
      extend ActiveSupport::Concern

      module ClassMethods
        def serialize_from_session(_id)
          self.new(id: -999, phone_number: '+375...', attempts: 0)
        end

        def serialize_into_session(record)
          [record.id]
        end
      end
    end
  end
end
