class CreateSocialAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :social_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :platform
      t.string :profile_link
      t.string :identifier

      t.timestamps
    end
  end
end
