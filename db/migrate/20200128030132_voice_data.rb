class VoiceData < ActiveRecord::Migration[5.2]
  def change
    drop_table :voice_data
  end
end
