class CreateRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      t.string :name
      t.string :content
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end
