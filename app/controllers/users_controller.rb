class UsersController < ApplicationController

  before_filter 'authorize!'
  before_filter 'self_authenticate(params[:id])', :only => [:edit, :delete, :update]
  before_filter :require_search_param, only: :index

  def index
    @all_city_hosts = User.alternative_matches(current_user.id, params[:search])
    @users = current_user.search(params[:search])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_registration_form)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_search_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render edit_user_path
    end
  end

  private
  # @advisor - .require does not work with materialize form
  def user_params_registration_form
    params.permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password, :all_interests)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password)
  end

  def require_search_param
    redirect_to users_search_path unless params[:search]
  end
end
