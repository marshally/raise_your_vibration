class SmsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :set_current_user
  rescue_from ActiveRecord::RecordInvalid, with: :not_found

  def receive
    if params["Body"].downcase == "publish"
      post.publish
      render plain: "Published!"
    else
      entry = post.entries.create!(body: params["Body"])
      render plain: "created '#{entry.body}' #{post_url(post)}"
    end
  end

  private

  def post
    current_user.newest_post
  end

  def set_current_user
    self.current_user = User.find_by!(phone_number: params["From"])
  end
end
