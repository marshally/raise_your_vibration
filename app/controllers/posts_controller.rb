class PostsController < ApplicationController
  before_action :require_login

  def newest
    @post = current_user.newest_post
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @entry = Entry.new(post_id: @post.id)
  end

  def publish
    Post.find(params[:id]).publish

    redirect_to :root
  end

  def require_login
    redirect_to :root unless current_user.present?
  end
end
