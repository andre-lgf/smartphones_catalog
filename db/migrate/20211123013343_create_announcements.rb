class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.integer :price
      t.integer :amount
      t.references :device_color, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
