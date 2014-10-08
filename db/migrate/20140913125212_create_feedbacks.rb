class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :grade
      t.date :date
      t.text :post

      t.timestamps
    end
  end
end
