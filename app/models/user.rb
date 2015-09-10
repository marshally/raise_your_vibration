class User < ActiveRecord::Base
  validates :fb_id, presence: :true
  validates :name, presence: :true
  validates :fb_image, presence: :true

  def self.find_or_create_from_auth_hash(auth_hash)
    User
      .create_with(
        token: auth_hash.credentials.token,
        name: auth_hash.info.name,
        fb_image: auth_hash.info.image,
      )
      .find_or_create_by(fb_id: auth_hash[:uid]).tap do |u|
    end
  end
end
