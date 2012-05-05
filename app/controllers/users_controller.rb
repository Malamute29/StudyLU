class UsersController < ApplicationController

  before_filter :authenticate,  :only =>  (:edit) #should contain :update too but was causing error
  def new
    @title = "Sign up"
  end

 # GET /users
  # GET /users.json
  def index
    @users = User.all
    @title  = "All users"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = @user.username  # Should change to full name

    
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render json: @user, status: :created, location: @user }
        sign_in @user
        flash[:success] = "Get ready to study with StudyLU!"
        redirect_to @user
        
      else
        # format.html { render action: "new" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        @title = "Sign up"
        render  'new'
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params(:user))
      @title = "Profile updated!"
      redirect_to @user
    else
      @title  = "Edit user"
      render  'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

private
def authenticate
  deny_access unless signed_in?
end

def correct_user
  @user = User.find(params(:id))
  redirect_to(root_path)  unless current_user?(@user)
end
    

 

