class GatewaysController < ApplicationController
    before_action :set_gateway, only: [ :show, :edit, :update, :destroy ]

    # GET /gateways
    def index
      @filter = params[:filter]
      @gateways = Gateway.all

      case @filter
      when "active"
        @gateways = @gateways.active
      when "inactive"
        @gateways = @gateways.inactive
      when "assigned"
        @gateways = @gateways.assigned
      when "unassigned"
        @gateways = @gateways.unassigned
      else
        @gateways = Gateway.all
      end
    end


    # GET /gateways/1
    def show
    end

    # GET /gateways/new
    def new
      @gateway = Gateway.new
    end

    # GET /gateways/1/edit
    def edit
    end

    # POST /gateways
    def create
      @gateway = Gateway.new(gateway_params)
      if @gateway.save
        redirect_to gateways_path, notice: "✅ Gateway erfolgreich erstellt."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /gateways/1
    def update
      if @gateway.update(gateway_params)
        redirect_to gateways_path, notice: "✅ Gateway erfolgreich aktualisiert."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /gateways/1
    def destroy
      @gateway.destroy
      redirect_to gateways_path, notice: "🗑 Gateway wurde gelöscht."
    end

    # GET /gateways/search
    def search
      if params[:gateway_query].present?
        @gateways = Gateway.where("serial LIKE ?", "%#{params[:gateway_query]}%")
      else
        @gateways = Gateway.all
      end
      render :index
    end

    private

    # findet den richtigen Gateway anhand der ID
    def set_gateway
      @gateway = Gateway.find(params[:id])
    end

    # erlaubt nur bestimmte Felder (strong parameters)
    def gateway_params
      params.require(:gateway).permit(:serial, :status, :server_id)
    end
end

  def destroy
    # code here
  end

  private

  def set_gateway
    # code here
  end
