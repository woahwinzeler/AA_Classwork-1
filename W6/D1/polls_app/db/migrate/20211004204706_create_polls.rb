class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :author_id
      t.string :title, null: false

      t.timestamps
    end
  end
end
