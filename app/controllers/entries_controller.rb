require 'entry'

class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.all
    @entry = Entry.new
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        @entries = Entry.all
        format.html { redirect_to :entries }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @entry.destroy
    redirect_to :entries
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:body, :order)
    end
end
