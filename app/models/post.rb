class Post < ActiveRecord::Base
  FB_GROUP_ID = "995885547126384"
  belongs_to :user
  has_many :entries

  def publish
    facebook.put_object("/#{FB_GROUP_ID}", "feed", message: body)
    update(posted_at: Time.now)
  end

  def suggested_body
    entries.map(&:body).join("\n")
  end

private

  def facebook
    facebook = Koala::Facebook::API.new(user.token)
  end
end
