class CreateScrims < ActiveRecord::Migration[7.2]
  def change
    create_table :scrims do |t|
      t.references :team_one, null: false, foreign_key: true
      t.references :team_two, null: false, foreign_key: true
      t.string :status
      t.string :result

      t.timestamps
    end
  end
end
