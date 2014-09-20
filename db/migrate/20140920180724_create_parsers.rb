class CreateParsers < ActiveRecord::Migration
  def change
    create_table :parsers do |t|

      t.timestamps
    end
  end
end
