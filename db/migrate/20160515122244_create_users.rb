class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :access_token
      t.string :facebook_auth_token
      t.string :facebook_id
      t.string :facebook_picture

      t.timestamps
    end
  end
end
