class RemoveBoardColumnFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :forum_messages, :board_id
    add_column :forum_messages, :forum_id, :integer
  end
end
