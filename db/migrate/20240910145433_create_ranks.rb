class CreateRanks < ActiveRecord::Migration[7.2]
  def change
    create_table :ranks do |t|
      t.references :account, null: false, foreign_key: true
      t.string :rank_tier
      t.integer :division

      t.timestamps
    end
  end
end
