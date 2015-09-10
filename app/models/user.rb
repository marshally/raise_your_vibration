class User < ActiveRecord::Base
  validates :fb_id, presence: :true
  validates :name, presence: :true
  validates :fb_image, presence: :true
end
