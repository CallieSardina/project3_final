# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @posts = @user.posts
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if (@user = User.find_by_id(params[:id]).present?)
      @user = User.find(params[:id])
      #@posts = @user.posts
    else
      raise ActiveRecord::RecordNotFound.new()
    end
    #@user = User.find(params[:id])
  #rescue ActiveRecord::RecordNotFound
    #render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
=begin
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if (@user = User.find_by_id(params[:id]).present?)
      @user = User.find(params[:id])
      @posts = @user.posts
    else
      raise ActiveRecord::RecordNotFound.new()
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path :see_other
  end

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
=end