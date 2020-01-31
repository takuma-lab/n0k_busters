class VoicesController < ApplicationController
  before_action :authenticate_user!
  before_action:set_voice, only: [:show, :edit, :update, :destroy]

  # GET /voices
  def index
    @voice = Voice.new
    @user = User.new
  end

  # GET /voices/new
  def new
    @voice = Voice.new
  end


  # POST /voices
  def create
    @voice = Voice.new
    @voice.user = current_user
    @voice.voice = params[:voice][:voice]
    
    if @voice.save
      redirect_to "/logs", notice: '保存しました。'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voice
      @voice = Voice.find(params[:id])
    end

end
