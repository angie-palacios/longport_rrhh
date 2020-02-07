class PayrollDiscountsController < ApplicationController
  before_action :set_payroll_discount, only: [:show, :edit, :update, :destroy]

  # GET /payroll_discounts
  # GET /payroll_discounts.json
  def index
    @payroll_discounts = PayrollDiscount.all
  end

  # GET /payroll_discounts/1
  # GET /payroll_discounts/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PayrollDiscountPdf.new(@payroll_discount)
        send_data pdf.render, filename: "reporte.pdf", type: "application/pdf"
      end
    end
  end

  # GET /payroll_discounts/new
  def new
    @payroll_discount = PayrollDiscount.new
  end

  # GET /payroll_discounts/1/edit
  def edit
  end

  # POST /payroll_discounts
  # POST /payroll_discounts.json
  def create
    @payroll_discount = PayrollDiscount.new(payroll_discount_params)

    respond_to do |format|
      if @payroll_discount.save
        format.html { redirect_to @payroll_discount, notice: 'Payroll discount was successfully created.' }
        format.json { render :show, status: :created, location: @payroll_discount }
      else
        format.html { render :new }
        format.json { render json: @payroll_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payroll_discounts/1
  # PATCH/PUT /payroll_discounts/1.json
  def update
    respond_to do |format|
      if @payroll_discount.update(payroll_discount_params)
        format.html { redirect_to @payroll_discount, notice: 'Payroll discount was successfully updated.' }
        format.json { render :show, status: :ok, location: @payroll_discount }
      else
        format.html { render :edit }
        format.json { render json: @payroll_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payroll_discounts/1
  # DELETE /payroll_discounts/1.json
  def destroy
    @payroll_discount.destroy
    respond_to do |format|
      format.html { redirect_to payroll_discounts_url, notice: 'Payroll discount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_discount
      @payroll_discount = PayrollDiscount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payroll_discount_params
      params.require(:payroll_discount).permit(:user_id, :value_discount, :month_discount, :concept)
    end
end
