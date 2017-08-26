class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.string :email
      t.string :name
      t.string :nickname
      t.string :image

      t.timestamps
    end
  end
end
