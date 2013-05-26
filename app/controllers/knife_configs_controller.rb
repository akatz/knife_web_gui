class KnifeConfigsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_knife_config, only: [:show, :edit, :update, :destroy]

  def index
    render json: current_user.knife_config
  end
end
