class CrittersController < ApplicationController
  before_action :set_critter, only: %i[ show edit update destroy ]

  # GET /critters or /critters.json
  def index
    @critters = Critter.all
  end

  # GET /critters/1 or /critters/1.json
  def show
  end

  # GET /critters/new
  def new
    @critter = Critter.new
  end

  # GET /critters/1/edit
  def edit
  end

  # POST /critters or /critters.json
  def create
    @critter = Critter.new(critter_params)

    respond_to do |format|
      if @critter.save
        format.html { redirect_to @critter, notice: "Critter was successfully created." }
        format.json { render :show, status: :created, location: @critter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @critter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /critters/1 or /critters/1.json
  def update
    respond_to do |format|
      if @critter.update(critter_params)
        format.html { redirect_to @critter, notice: "Critter was successfully updated." }
        format.json { render :show, status: :ok, location: @critter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @critter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critters/1 or /critters/1.json
  def destroy
    @critter.destroy
    respond_to do |format|
      format.html { redirect_to critters_url, notice: "Critter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critter
      @critter = Critter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def critter_params
      params.require(:critter).permit(:name)
    end
end
