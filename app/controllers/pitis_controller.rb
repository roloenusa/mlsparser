class PitisController < ApplicationController
  before_action :set_piti, only: [:show, :edit, :update, :destroy]

  # GET /pitis
  # GET /pitis.json
  def index
    @pitis = Piti.all

    respond_to do |format|
      format.html { render index: @pitis }
      format.json { render json: @pitis }
    end
  end

  # GET /pitis/1
  # GET /pitis/1.json
  def show
  end

  # GET /pitis/new
  def new
    @piti = Piti.new
  end

  # GET /pitis/1/edit
  def edit
  end

  # POST /pitis
  # POST /pitis.json
  def create
    @piti = Piti.new(piti_params)

    respond_to do |format|
      if @piti.save
        format.html { redirect_to @piti, notice: 'Piti was successfully created.' }
        format.json { render :show, status: :created, location: @piti }
      else
        format.html { render :new }
        format.json { render json: @piti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pitis/1
  # PATCH/PUT /pitis/1.json
  def update
    respond_to do |format|
      if @piti.update(piti_params)
        format.html { redirect_to @piti, notice: 'Piti was successfully updated.' }
        format.json { render :show, status: :ok, location: @piti }
      else
        format.html { render :edit }
        format.json { render json: @piti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitis/1
  # DELETE /pitis/1.json
  def destroy
    @piti.destroy
    respond_to do |format|
      format.html { redirect_to pitis_url, notice: 'Piti was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /pitis/default
  # GET /pitis/default.json
  def default
    data = {
      default: Piti.build,
      tax: Piti::TAX,
      insurance: Piti::INSURANCE,
      maturity: Piti::MATURITY,
      interest: Piti::INTEREST
    }


    respond_to do |format|
      format.html { redirect_to pitis_url, notice: 'Piti was successfully destroyed.' }
      format.json { render json: data, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piti
      @piti = Piti.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piti_params
      params.require(:piti).permit(:listing_id, :price, :down, :interest, :maturity, :tax, :insurance)
    end
end
