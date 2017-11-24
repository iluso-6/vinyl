class AddUploadmusicToRecordings < ActiveRecord::Migration[5.1]
  def change
    add_column :recordings, :upsongs, :string
  end
end
