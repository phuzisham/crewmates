class AddAvailabilityColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :available, :string
  end
end
