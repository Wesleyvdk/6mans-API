class CreateQueues < ActiveRecord::Migration[7.2]
  def change
    create_table :queues do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :server, null: false, foreign_key: true
      t.string :queue_type
      t.integer :status

      t.timestamps
    end
  end
end
