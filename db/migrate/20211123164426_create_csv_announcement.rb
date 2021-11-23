class CreateCsvAnnouncement < ActiveRecord::Migration[5.2]
  def change
    create_table :csv_announcements do |t|
      t.references :csv, foreign_key: true
      t.references :announcement, foreign_key: true
    end
  end
end
