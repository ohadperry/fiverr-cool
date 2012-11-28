class Rating < ActiveRecord::Base
  attr_accessible :pic_url, :rating

  mount_uploader :pic_url , ImageUploader
end
