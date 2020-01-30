class LogsController < ApplicationController

  def index
    @voices = current_user.voices
    @voices = Voice.page(params[:page]).per(3)
  end

end
