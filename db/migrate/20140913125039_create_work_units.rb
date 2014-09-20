class CreateWorkUnits < ActiveRecord::Migration
  def change
    create_table :work_units do |t|
      t.string :name
      t.string :address
      t.string :city
      t.references  :medics
      t.timestamps
    end
  end
end
