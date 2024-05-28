class OrdrersController < ApplicationController
  before_action :set_ordrer, only: %i[ show edit update destroy ]

  # GET /ordrers or /ordrers.json
  def index
    @ordrers = Ordrer.all
  end

  # GET /ordrers/1 or /ordrers/1.json
  def show
  end

  # GET /ordrers/new
  def new
    @ordrer = Ordrer.new
  end

  # GET /ordrers/1/edit
  def edit
  end

  # POST /ordrers or /ordrers.json
  def create
    @ordrer = Ordrer.new(ordrer_params)

    respond_to do |format|
      if @ordrer.save
        format.html { redirect_to ordrer_url(@ordrer), notice: "Ordrer was successfully created." }
        format.json { render :show, status: :created, location: @ordrer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordrer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordrers/1 or /ordrers/1.json
  def update
    respond_to do |format|
      if @ordrer.update(ordrer_params)
        format.html { redirect_to ordrer_url(@ordrer), notice: "Ordrer was successfully updated." }
        format.json { render :show, status: :ok, location: @ordrer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordrer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordrers/1 or /ordrers/1.json
  def destroy
    @ordrer.destroy!

    respond_to do |format|
      format.html { redirect_to ordrers_url, notice: "Ordrer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordrer
      @ordrer = Ordrer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordrer_params
      params.fetch(:ordrer, {})
    end
end
