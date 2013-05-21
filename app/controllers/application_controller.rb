class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, except: :index
  def index
  end

  def sync
  	ServerSync.new(ENV['SYNC_KEY'], ENV['SYNC_SECRET']).persist
  	render json: Server.all
  end
end
