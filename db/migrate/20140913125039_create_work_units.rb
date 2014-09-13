class CreateWorkUnits < ActiveRecord::Migration
  def change
    create_table :work_units do |t|
      t.string :name
      t.stringcity :address

      t.timestamps
    end
  end
end
