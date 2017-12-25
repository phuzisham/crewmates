class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.integer :user_id
      t.string :title
      t.string :description
    end
  end
end
