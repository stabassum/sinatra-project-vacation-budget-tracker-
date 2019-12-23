class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |v|
      v.string :description
      v.string :date
      v.string :departure
      v.string :destination
      v.integer :budget
      v.integer :spending
      v.integer :user_id
    end
  end
end

