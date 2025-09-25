class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  def index
    @servers = Server.all
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
      redirect_to servers_path, notice: "✅ Server erfolgreich erstellt."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servers/1
  def update
    if @server.update(server_params)
      redirect_to servers_path, notice: "✅ Server erfolgreich aktualisiert."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /servers/1
  def destroy
    @server= Server.find(params[:id])
    @server.destroy
    redirect_to servers_path, notice: "🗑 Server wurde gelöscht."
  end

  # GET /servers/search
  def search
    if params[:server_query].present?
      @servers = Server.where("name LIKE ?", "%#{params[:server_query]}%")
    else
      @servers = Server.all
    end
    render :index
  end

  private

  # findet den richtigen Server anhand der ID
  def set_server
    @server = Server.find(params[:id])
  end

  # erlaubt nur bestimmte Felder (strong parameters)
  def server_params
    params.require(:server).permit(:name, :status)
  end
end
