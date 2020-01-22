class LogsController < ApplicationController
  
  def index
    @users = User.page(params[:page]).per(3)
  end
  
  def show
  end
  
end
