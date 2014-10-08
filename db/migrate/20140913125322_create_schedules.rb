class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :in
      t.datetime :out
      t.references :medic
      t.timestamps
    end
  end
end
