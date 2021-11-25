class CreateDeviceColors < ActiveRecord::Migration[5.2]
  def change
    create_table :device_colors do |t|
      t.references :device, foreign_key: true
      t.references :color, foreign_key: true
    end
  end
end
