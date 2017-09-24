class CreatePrayers < ActiveRecord::Migration[5.1]
  def change
    create_table :prayers do |t|
      t.integer :count

      t.timestamps
    end
  end
end
