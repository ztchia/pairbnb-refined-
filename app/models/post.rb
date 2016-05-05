class Post < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  mount_uploader :picture, PostUploader
end
