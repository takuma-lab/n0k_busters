class LogsController < ApplicationController

  def index
    @user_voices = current_user.voices.all
    @voices = Voice.page(params[:page]).per(3)
  end

end
