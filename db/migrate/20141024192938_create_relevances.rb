class CreateRelevances < ActiveRecord::Migration
  def change
    create_table :relevances do |t|
      t.boolean :value
      t.references :user
      t.references :comment

      t.timestamps
    end
  end
end
