class DisclaimersController < ApplicationController
  before_action :set_disclaimer, only: [:show, :edit, :update, :destroy]

  # GET /disclaimers
  # GET /disclaimers.json
  def index
    @disclaimers = Disclaimer.all
  end

  # GET /disclaimers/1
  # GET /disclaimers/1.json
  def show
  end

  # GET /disclaimers/new
  def new
    @disclaimer = Disclaimer.new
  end

  # GET /disclaimers/1/edit
  def edit
  end

  # POST /disclaimers
  # POST /disclaimers.json
  def create
    @disclaimer = Disclaimer.new(disclaimer_params)

    respond_to do |format|
      if @disclaimer.save
        format.html { redirect_to @disclaimer, notice: 'Disclaimer was successfully created.' }
        format.json { render :show, status: :created, location: @disclaimer }
      else
        format.html { render :new }
        format.json { render json: @disclaimer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disclaimers/1
  # PATCH/PUT /disclaimers/1.json
  def update
    respond_to do |format|
      if @disclaimer.update(disclaimer_params)
        format.html { redirect_to @disclaimer, notice: 'Disclaimer was successfully updated.' }
        format.json { render :show, status: :ok, location: @disclaimer }
      else
        format.html { render :edit }
        format.json { render json: @disclaimer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disclaimers/1
  # DELETE /disclaimers/1.json
  def destroy
    @disclaimer.destroy
    respond_to do |format|
      format.html { redirect_to disclaimers_url, notice: 'Disclaimer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disclaimer
      @disclaimer = Disclaimer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disclaimer_params
      params.require(:disclaimer).permit(:employee, :city_id, :start_at, :end_at, :creator, :buiness_id, :aceepted)
    end
end
