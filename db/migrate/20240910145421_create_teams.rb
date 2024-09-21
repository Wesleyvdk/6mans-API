class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.string :owner_id


      t.timestamps
    end
  end
end
