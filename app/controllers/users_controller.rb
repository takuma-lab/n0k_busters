class UsersController < ApplicationController

  def logs
    @voices = Voice.find_by(id: params[:id])
  end

end
