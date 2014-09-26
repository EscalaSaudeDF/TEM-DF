class CreateWorkUnits < ActiveRecord::Migration
  def change
    create_table :work_units do |t|
      t.string :name_work_unit
      t.string :address
      t.string :city
      t.references  :medic, :schedule
      t.timestamps
    end
  end
end
