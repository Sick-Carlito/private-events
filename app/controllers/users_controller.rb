class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if params[:id] == current_user.id
      @user = current_user
      @attended_events = Event.where('creator_id = ?', @user.id)
      @past_attended_events = User.past_attended_event
      @upcoming_attended_events = Attendance.upcoming_attended_events(@user.id)
    end
    
    # @user = User.find(params[:id])
    # @attended_events = current_user.attendances
    # @upcoming_attended_events = current_user.upcoming_attended_events
    # @past_attended_events = current_user.past_attended_events
  end

  # GET /users/new
  def new
    @user = User.new
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
        session[:creator_id] = @user.id
        format.html { redirect_to signin_url, notice: 'User was successfully created.' }
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
      if @user.update(user_params)
        format.html { redirect_to signin_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
=begin
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def invite
    @user = User.find_by(params[:id])
    @event = Event.find(params[:event_id])
    invited_guests = params[:invitation][:users].strip.split(',').map(&:strip)
    
    invited_guests.each do |invited_guest|
      user = User.find_by(name: invited_guest)
      @user.invite(user, @event) if user
    end

    redirect_to event_url(@event)
  end
=end


  # def attendances
  #   @user = User.find(params[:id])
  #   @event = Event.find(params[:event_id])
  #   @user.attend(@event) if event.include?(@user)

  #   redirect_to user_path(@user)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
