class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
