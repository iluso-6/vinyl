class Item < ApplicationRecord
  has_many :recordings, dependent: :destroy
       mount_uploader :avatar, AvatarUploader
       mount_uploader :song, MusicUploader
       serialize :audioarray, Array
     
end
