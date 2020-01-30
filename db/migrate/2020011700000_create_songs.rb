class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    drop_table :songs do |t|
      t.string :title
      t.text :description
      t.string :user_id
      t.string :voice

      t.timestamps

    end
  end
end