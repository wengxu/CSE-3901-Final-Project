class CreateFreeTimes < ActiveRecord::Migration
  def change
    create_table :free_times do |t|
      t.references :student, index: true
      t.string :day
      t.string :timeSlot

      t.timestamps
    end
  end
end
