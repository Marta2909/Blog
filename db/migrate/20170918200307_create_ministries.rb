class CreateMinistries < ActiveRecord::Migration[5.1]
  def change
    create_table :ministries do |t|
      t.string :city
      t.string :parish
      t.string :name
      t.string :page
      t.string :meeting_day
      t.string :meeting_time
      t.string :address

      t.timestamps
    end
  end
end
