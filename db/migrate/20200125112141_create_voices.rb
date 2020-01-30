class CreateVoices < ActiveRecord::Migration[5.2]
  def change
    create_table :voices do |t|
      t.references :user, foreign_key: true
      t.string :voice

      t.timestamps
    end
  end
end
