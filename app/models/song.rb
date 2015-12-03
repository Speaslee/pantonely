class Song < ActiveRecord::Base
mount_uploader :songfile, DjUploader
acts_as_taggable
#process_in_background :songfile


end
