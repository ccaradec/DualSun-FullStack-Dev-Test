class InstallationsController < ApplicationController
  before_action :set_installation, only: [:show, :update, :destroy]
  before_action :context_from_params, only: [:create, :update]
  # GET /installations
  def index
    @installations = Installation.all

    render json: @installations
  end

  # GET /installations/1
  def show
    render json: @installation
  end

  # POST /installations
  def create
    @installation = Installation.new(clean_params)
    set_context

    if @installation.save
      render json: @installation, status: :created, location: @installation
    else
      render json: @installation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /installations/1
  def update
    set_context

    if @installation.update(clean_params)
      render json: @installation
    else
      render json: @installation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /installations/1
  def destroy
    @installation.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_installation
      @installation = Installation.find(params[:id])
    end

    def context_from_params
      @company = Company.find_by(
        installation_params[:company]
      ) || Company.new(installation_params[:company])

      @customer = Customer.find_by(
        email: installation_params[:customer][:email]
      ) || Customer.new(installation_params[:customer])

      @panels = []
      installation_params[:panels].each do |p|
        @panels << Panel.find_by(p) || Panel.new(p)
      end
    end

    def set_context
      @installation.company = @company
      @installation.customer = @customer
      @installation.panels = @panels
    end

    # Only allow a list of trusted parameters through.
    def installation_params
      params.require(:installation).permit(
        :street,
        :city,
        :zipcode,
        :country,
        :installation_date,
        customer: [:id, :fname, :lname, :email, :phone],
        company: [:id, :name, :siren],
        panels: [:panel_type, :panel_id]
      )
    end

    def clean_params
      installation_params.except(:customer, :company, :panels)
    end
end
