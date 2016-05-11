class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.decimal :lat
      t.decimal :long
      t.timestamp :endtime
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
