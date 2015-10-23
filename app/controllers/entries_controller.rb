require 'entry'

class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_post

  # GET /entries
  def index
    @entries = @post.entries
    @entry = @post.entries.new
  end

  # POST /entries
  def create
    @entry = @post.entries.new(entry_params)

    respond_to do |format|
      if @entry.save
        @entries = Entry.all
        format.html { redirect_to @post }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @entry.destroy
    redirect_to @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def set_post
      @post  = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:body, :order)
    end
end
