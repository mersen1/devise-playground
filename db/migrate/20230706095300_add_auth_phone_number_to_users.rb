class AddAuthPhoneNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth_phone_number, :string
  end
end
