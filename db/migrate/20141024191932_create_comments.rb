class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :comment_status
      t.boolean :report
      t.datetime :date
      t.references :user
      t.references :medic

      t.timestamps
    end
  end
end
