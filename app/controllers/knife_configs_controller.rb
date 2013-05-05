class KnifeConfigsController < ApplicationController
  before_action :set_knife_config, only: [:show, :edit, :update, :destroy]

  # GET /knife_configs
  def index
    @knife_configs = KnifeConfig.all
  end

  # GET /knife_configs/1
  def show
  end

  # GET /knife_configs/new
  def new
    @knife_config = KnifeConfig.new
  end

  # GET /knife_configs/1/edit
  def edit
  end

  # POST /knife_configs
  def create
    @knife_config = KnifeConfig.new(knife_config_params)

    if @knife_config.save
      redirect_to @knife_config, notice: 'Knife config was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /knife_configs/1
  def update
    if @knife_config.update(knife_config_params)
      redirect_to @knife_config, notice: 'Knife config was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /knife_configs/1
  def destroy
    @knife_config.destroy
    redirect_to knife_configs_url, notice: 'Knife config was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knife_config
      @knife_config = KnifeConfig.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def knife_config_params
      params.require(:knife_config).permit(:aws_key, :aws_secret_key, :knife_rb)
    end
end
