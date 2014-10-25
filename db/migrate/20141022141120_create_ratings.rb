class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :grade
      t.datetime :date
      t.references :medic, :user
      t.timestamps
    end
  end
end
