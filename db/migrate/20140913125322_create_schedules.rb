class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :in
      t.date :out

      t.timestamps
    end
  end
end
