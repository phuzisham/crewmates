class AddDetailColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :detail, :text
  end
end
