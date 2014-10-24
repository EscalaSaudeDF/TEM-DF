class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date
      t.text :content
      t.references :user
      t.references :medic

      t.timestamps
    end
  end
end
