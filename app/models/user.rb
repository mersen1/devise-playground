class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  Phonelib.default_country = "US"

  validates :email, presence: true
  validates :auth_phone_number, phone: {
    possible: true,
    allow_blank: false,
    types: [:mobile]
  }

  class << self
    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        where(conditions.to_h)
          .where(["auth_phone_number = :value OR LOWER(email) = :value", { value: login.downcase }])
          .first
      elsif conditions.has_key?(:auth_phone_number) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
  end

  def login
    @login || auth_phone_number || email
  end
end
