class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |u|
      u.string :username
      u.string :email
      u.string :password
      u.string :password_digest
    end
  end

end
