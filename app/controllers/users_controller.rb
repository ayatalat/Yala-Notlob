class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #to only show login user details 
    @currentUser = current_user
    @users=User.all
    @orders=@currentUser.orders.all
    @friends=@currentUser.friends

    render 'show'
  end

  # GET /users/1
  # GET /users/1.json
  def show 
     @orders=@currentUser.orders.all
      @friends=@currentUser.friends
  end

  # GET /users/new
  def new
    @user = User.new
    if(@user.save)
    redirect_to @user
    else
    render 'new'
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @currentUser.update(user_params)
        format.html { redirect_to @currentUser, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @currentUser }
      else
        format.html { render :edit }
        format.json { render json: @currentUser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def add_friend
  #   @friend=User.find_by_email(params[:email])
  #   @currentUser=current_user
  #   # @currentUser = User.create(name: @currentUser.name)
  #   # @friend = User.create(name: @friend.name)
  #   @currentUser.friend_request(@friend)
  #   @friend.accept_request(@currentUser)
 
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @currentUser = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :email, :avatar)
    end
end
