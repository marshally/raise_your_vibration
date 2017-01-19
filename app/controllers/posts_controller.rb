class PostsController < ApplicationController
  before_action :require_login
  before_action :require_phone_number

  def newest
    @post = current_user.newest_post
    redirect_to @post
  end

  def show
    @post = current_user.posts.find(params[:id])
    @entry = Entry.new(post_id: @post.id)
  end

  def publish
    @post = current_user.posts.find(params[:id])
    @post.publish

    redirect_to :root
  end

  private
  def require_login
    redirect_to :root unless current_user.present?
  end

  def require_phone_number
    redirect_to edit_user_path(current_user) unless current_user.phone_number.present?
  end
end
