class Song < ActiveRecord::Base
mount_uploader :songfile, DjUploader
acts_as_taggable
acts_as_taggable_on :tags

belongs_to :user

end
