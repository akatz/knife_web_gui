class ServersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  def index
    render json: Server.all
  end

  # GET /servers/1
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  def create
    @server = Server.new(server_params)

    if @server.save
      redirect_to @server, notice: 'Server was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /servers/1
  def update
    if @server.update(server_params)
      respond_to do |format|
        format.html { redirect_to @server, notice: 'Server was successfully updated.'}
        format.json { render json: @server, status: :updated }
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /servers/1
  def destroy
    if @server.destroy
      respond_to do |format|
        format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.'}
        format.json { render json: {}, status: :no_content }
      end
    else
      respond_with { render "", status: :not_found}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def server_params
      params.require(:server).permit(:instance_id, :name, :public_ip, :private_ip, :flavor, :image, :ssh_key_name, :security_groups, :state)
    end
end
