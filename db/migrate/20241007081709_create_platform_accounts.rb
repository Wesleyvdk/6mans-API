class CreatePlatformAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :platform_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :platform
      t.string :profile_link
      t.string :identifier

      t.timestamps
    end
  end
end
