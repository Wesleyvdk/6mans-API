class CreateMatchParticipants < ActiveRecord::Migration[7.2]
  def change
    create_table :match_participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
