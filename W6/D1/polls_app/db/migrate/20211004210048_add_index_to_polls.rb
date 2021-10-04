class AddIndexToPolls < ActiveRecord::Migration[5.2]
  def change
    add_index :polls, :title
  end
end
