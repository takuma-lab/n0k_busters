class VoiceDataController < ApplicationController
  before_action :set_voice_datum, only: [:show, :edit, :update, :destroy]

  # GET /voice_data
  def index
    @voice_data = VoiceDatum.all
  end

  # GET /voice_data/1
  def show
  end

  # GET /voice_data/new
  def new
    @voice_datum = VoiceDatum.new
  end

  # GET /voice_data/1/edit
  def edit
  end

  # POST /voice_data
  def create
    @voice_datum = VoiceDatum.new(voice_datum_params)

    if @voice_datum.save
      redirect_to @voice_datum, notice: 'Voice datum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /voice_data/1
  def update
    if @voice_datum.update(voice_datum_params)
      redirect_to @voice_datum, notice: 'Voice datum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /voice_data/1
  def destroy
    @voice_datum.destroy
    redirect_to voice_data_url, notice: 'Voice datum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voice_datum
      @voice_datum = VoiceDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def voice_datum_params
      params.require(:voice_datum).permit(:id, :user_id, :voice, :voice_cache, :remove_voice)
    end
end
