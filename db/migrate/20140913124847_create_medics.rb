class CreateMedics < ActiveRecord::Migration
  def change
    create_table :medics do |t|
      t.string :name
      t.integer :registry
      t.string :speciality
      t.string :department
      t.references :work_unit
      t.float :average
      t.timestamps
    end
  end
end
