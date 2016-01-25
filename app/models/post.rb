class Post < ActiveRecord::Base
  FB_GROUP_ID = "995885547126384"
  belongs_to :user
  has_many :entries

  def publish
    update(body: suggested_body)
    post_to_facebook
  end

  def suggested_body
    entries.map(&:body).join("\n")
  end

private

  def facebook
    facebook = Koala::Facebook::API.new(user.token)

  def post_to_facebook
    facebook.put_object("/#{FB_GROUP_ID}", "feed", message: body)
    update(posted_at: Time.now)
  end
end
