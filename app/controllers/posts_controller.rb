class PostsController < ApplicationController
  before_action :require_login

  def newest
    @post = Post.find_or_create_by(user_id: current_user.id, posted_at: nil)
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @entry = Entry.new(post_id: @post.id)
  end

  def publish
    @post = Post.find(params[:id])
    @post.update(body: @post.suggested_body)
    @post.publish

    redirect_to :root
  end

  def require_login
    unless current_user.present?
      redirect_to :root
    end
  end
end
