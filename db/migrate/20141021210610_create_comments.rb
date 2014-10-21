class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date
      t.text :comment
      t.references :medic, :user 

      t.timestamps
    end
  end
end
