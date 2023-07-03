class HomeController < ApplicationController
  def index
    unless user_with_2_auth_signed_in?
      redis_conn = Redis.new
      user = UserWith2Auth.new(key: SecureRandom.uuid, phone_number: '+375 ...', attempts: 1)

      redis_conn.hmset(user.key, *user.attributes)
      redis_conn.expire(user.key, 600)

      sign_in(:user_with_2_auth, user)
    end
  end
end
