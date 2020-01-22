class CreateVoiceData < ActiveRecord::Migration[5.2]
  def change
    create_table :voice_data do |t|
      t.integer :voice_id
      t.integer :user_id
      t.string :voice
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
