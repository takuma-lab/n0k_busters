class VoicesController < ApplicationController
  before_action :authenticate_user!
  before_action:set_voice, only: [:show, :edit, :update, :destroy]

  # GET /voices
  def index
    @voice = Voice.new
    @user = User.new
  end

  # GET /voices/1
  def show
    @voice = Voice.find_by(id: params[:id])
    @user = User.find_by(id: @voice.user_id)
  end

  # GET /voices/new
  def new
    @voice = Voice.new
  end

  # GET /voices/1/edit
  def edit
  end

  # POST /voices
  def create
    @voice = Voice.new
    @voice.user = current_user
    @voice.voice = params[:voice][:voice]
    
    if @voice.save
      redirect_to @voice, notice: 'Voice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /voices/1
  def update
    if @voice.update(voice_params)
      redirect_to @voice, notice: 'Voice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /voices/1
  def destroy
    @voice.destroy
    redirect_to voices_url, notice: 'Voice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voice
      @voice = Voice.find(params[:id])
    end

  def logs
    @voice = Voice.find_by(id: params[:id])
    @user = User.find_by(id: @voice.user_id)
    @voice = Voice.page(params[:page]).per(3)
  end

    # Only allow a trusted parameter "white list" through.
    #def voice_params
      #params.require(:voice).permit(:voice)
    #end
end
