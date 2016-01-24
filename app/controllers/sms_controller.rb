class SmsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :set_current_user
  rescue_from ActiveRecord::RecordInvalid, with: :not_found

  def receive
    if params["Body"].downcase == "publish"
      current_user.newest_post.publish
      render plain: "Published!"
    else
      entry = current_user.newest_post.entries.create!(body: params["Body"])
      render plain: "created '#{entry.body}'"
    end
  end

  private

  def set_current_user
    self.current_user = User.find_by!(phone_number: params["From"])
  end
end
