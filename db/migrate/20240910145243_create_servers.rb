class CreateServers < ActiveRecord::Migration[7.2]
  def change
    create_table :servers do |t|
      t.string :server_id
      t.string :name

      t.timestamps
    end
  end
end
