class AddUploadSongsToRecordings < ActiveRecord::Migration[5.1]
  add_column :recordings, :upload_songs, :string, array: true, default: []
  def change
  end
end
