class Recording < ApplicationRecord
    belongs_to :item 
       mount_uploader :upsongs, MusicUploader
       #   before_save :update_asset_attributes
  
  private
  
  def update_asset_attributes
  
  end
  
end

