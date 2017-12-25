class CreateForumMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_messages do |t|
      t.integer :user_id
      t.integer :forum_id
      t.string :title
      t.string :body
    end
  end
end
