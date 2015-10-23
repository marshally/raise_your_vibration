class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to newest_posts_path
    end
  end
end
