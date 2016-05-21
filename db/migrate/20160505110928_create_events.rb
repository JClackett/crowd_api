class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.timestamp :endtime


      t.timestamps
    end
  end
end
