class LogsController < ApplicationController

  def index
    @user_voices = current_user.voices.all
    @user_voices = @user_voices.page(params[:page]).per(3)
  end

end
