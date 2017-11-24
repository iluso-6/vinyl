class AddAudioarrayToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :audioarray, :string
  end
end
