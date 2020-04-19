class QuizDefaultsController < ApplicationController
  before_action :set_quiz_default, only: [:show, :edit, :update, :destroy]

  # GET /quiz_defaults
  # GET /quiz_defaults.json
  def index
    @quiz_defaults = QuizDefault.all
  end

  # GET /quiz_defaults/1
  # GET /quiz_defaults/1.json
  def show
  end

  # GET /quiz_defaults/new
  def new
    @quiz_default = QuizDefault.new
  end

  # GET /quiz_defaults/1/edit
  def edit
  end

  # POST /quiz_defaults
  # POST /quiz_defaults.json
  def create
    @quiz_default = QuizDefault.new(quiz_default_params)

    respond_to do |format|
      if @quiz_default.save
        format.html { redirect_to @quiz_default, notice: 'Quiz default was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_default }
      else
        format.html { render :new }
        format.json { render json: @quiz_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_defaults/1
  # PATCH/PUT /quiz_defaults/1.json
  def update
    respond_to do |format|
      if @quiz_default.update(quiz_default_params)
        format.html { redirect_to @quiz_default, notice: 'Quiz default was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_default }
      else
        format.html { render :edit }
        format.json { render json: @quiz_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_defaults/1
  # DELETE /quiz_defaults/1.json
  def destroy
    @quiz_default.destroy
    respond_to do |format|
      format.html { redirect_to quiz_defaults_url, notice: 'Quiz default was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_default
      @quiz_default = QuizDefault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_default_params
      params.require(:quiz_default).permit(:content)
    end
end
