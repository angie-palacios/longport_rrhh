class ProfilesController < ApplicationController
before_action :set_user, only: [:show,:edit, :update, :destroy, :edit_status_permission]

  # GET /users
  def index
    @users = User.all
    respond_to do | format |
      format.html
      format.json {
        if params.has_key?(:type) && params[:type] == "select2"
          render json: User.select2(params[:q])
        end
      }
    end
  end
  
  # GET /permissions
  def show
    @permissions = Permission.all
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end

  # POST /user/create
  def create
    @user = User.new(user_params)
    if @user.save
      EmailMailer.confirmationregisterusers(@user).deliver
      redirect_to profile_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

     # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to profiles_url, notice: 'User was successfully destroyed.'
  end

  def edit_status_permission
    if params[:apply] && params[:apply] == "true"
      @user.permissions << Permission.find_by(:code => params[:code])
    else
      permission=@user.permissions.find_by(:code => params[:code])
      # puts "-----------------------------------------"
      # puts permission.as_json
      puts @user.permissions.as_json
      # puts "-----------------------------------------"
      @user.permissions.delete(permission)
    end

    respond_to do | format |
      format.json {
        render json: {
          :message => 'ok'
        }
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :business_id, :status, :documentation, :name, :date_initiated, :analytical_account, :position, :sex, :date_birth, :date_finality, :salary, :variable_salary, :constitutive_compensation, :constitutive_not_compensation, :contract, :address, :neighborhood, :phone, :marital_status, :profession, :eps, :afp, :photo, :rol_id)
    end

end
