class UserWith2Auth
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization
  include ActiveModel::Validations

  extend ActiveModel::Callbacks
  extend Devise::Models

  define_model_callbacks :validation

  devise :redis_authenticatable

  attribute :key, :string
  attribute :phone_number, :string
  attribute :attempts, :integer
end