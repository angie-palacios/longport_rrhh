class ProfilesController < ApplicationController
before_action :set_user, only: [:show,:edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/new
  def show
    @permission = Permission.all
  end
  
  # GET /users/1/edit
  def edit
  end

  # POST /user/create
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to profiles_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

     # PATCH/PUT /users/1
   def update
    if @user.update(user_params)
      redirect_to profiles_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to profiles_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :business, :status, :documentation, :name, :date_initiated, :analytical_account, :position, :sex, :date_birth, :date_finality, :salary, :variable_salary, :constitutive_compensation, :constitutive_not_compensation, :contract, :address, :neighborhood, :phone, :marital_status, :profession, :eps, :afp, :photo, :rol_id)
    end

end
