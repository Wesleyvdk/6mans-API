class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :rl_account_id
      t.string :platform

      t.timestamps
    end
  end
end
