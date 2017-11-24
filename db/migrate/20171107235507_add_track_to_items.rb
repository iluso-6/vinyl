class AddTrackToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :song, :string
  end
end
