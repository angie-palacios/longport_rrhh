class DisclaimerQuizDefaultsController < ApplicationController
  before_action :set_disclaimer_quiz_default, only: [:show, :edit, :update, :destroy]

  # GET /disclaimer_quiz_defaults
  # GET /disclaimer_quiz_defaults.json
  def index
    @disclaimer_quiz_defaults = DisclaimerQuizDefault.all
  end

  # GET /disclaimer_quiz_defaults/1
  # GET /disclaimer_quiz_defaults/1.json
  def show
  end

  # GET /disclaimer_quiz_defaults/new
  def new
    @disclaimer_quiz_default = DisclaimerQuizDefault.new
  end

  # GET /disclaimer_quiz_defaults/1/edit
  def edit
  end

  # POST /disclaimer_quiz_defaults
  # POST /disclaimer_quiz_defaults.json
  def create
    @disclaimer_quiz_default = DisclaimerQuizDefault.new(disclaimer_quiz_default_params)

    respond_to do |format|
      if @disclaimer_quiz_default.save
        format.html { redirect_to @disclaimer_quiz_default, notice: 'Disclaimer quiz default was successfully created.' }
        format.json { render :show, status: :created, location: @disclaimer_quiz_default }
      else
        format.html { render :new }
        format.json { render json: @disclaimer_quiz_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disclaimer_quiz_defaults/1
  # PATCH/PUT /disclaimer_quiz_defaults/1.json
  def update
    respond_to do |format|
      if @disclaimer_quiz_default.update(disclaimer_quiz_default_params)
        format.html { redirect_to @disclaimer_quiz_default, notice: 'Disclaimer quiz default was successfully updated.' }
        format.json { render :show, status: :ok, location: @disclaimer_quiz_default }
      else
        format.html { render :edit }
        format.json { render json: @disclaimer_quiz_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disclaimer_quiz_defaults/1
  # DELETE /disclaimer_quiz_defaults/1.json
  def destroy
    @disclaimer_quiz_default.destroy
    respond_to do |format|
      format.html { redirect_to disclaimer_quiz_defaults_url, notice: 'Disclaimer quiz default was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disclaimer_quiz_default
      @disclaimer_quiz_default = DisclaimerQuizDefault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disclaimer_quiz_default_params
      params.require(:disclaimer_quiz_default).permit(:disclaimer_id, :quiz_default_id)
    end
end
