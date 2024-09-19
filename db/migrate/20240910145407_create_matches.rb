class CreateMatches < ActiveRecord::Migration[7.2]
  def change
    create_table :matches do |t|
      t.references :queue, null: false, foreign_key: true
      t.string :result

      t.timestamps
    end
  end
end
