class FreeTimesController < ApplicationController
  
  before_action :set_free_time, only: [:show, :edit, :update, :destroy]

  # GET /free_times
  # GET /free_times.json
  def index
    @free_times = FreeTime.all
  end

  # GET /free_times/1
  # GET /free_times/1.json
  def show
  end

  # GET /free_times/new
  def new
    @free_time = FreeTime.new
  end

  # GET /free_times/1/edit
  def edit
  end

  # POST /free_times
  # POST /free_times.json
  def create
	puts params.to_s
    if params[:user_id] 
    user = User.find(params[:user_id])
    @free_time = user.free_times.build(user_id: params[:user_id], day: params[:day], timeSlot: params[:timeSlot])
    
    else 
	user = User.find(params[:free_time][:user_id])
    @free_time = user.free_times.build(user_id: params[:free_time][:user_id], day: params[:free_time][:day], timeSlot: params[:free_time][:timeSlot])
    end

    respond_to do |format|
      if @free_time.save
        format.html { redirect_to @free_time, notice: 'Free time was successfully created.' }
        format.json { render :show, status: :created, location: @free_time }
      else
        format.html { render :new }
        format.json { render json: @free_time.errors, status: :unprocessable_entity }
      end
    end
  puts @free_time.errors[:user].to_s
  puts @free_time.errors[:day].to_s
  puts @free_time.errors[:timeSlot].to_s
  end

  # PATCH/PUT /free_times/1
  # PATCH/PUT /free_times/1.json
  def update
    respond_to do |format|
      if @free_time.update(free_time_params)
        format.html { redirect_to @free_time, notice: 'Free time was successfully updated.' }
        format.json { render :show, status: :ok, location: @free_time }
      else
        format.html { render :edit }
        format.json { render json: @free_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /free_times/1
  # DELETE /free_times/1.json
  def destroy
    @free_time.destroy
    respond_to do |format|
      format.html { redirect_to free_times_url, notice: 'Free time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_free_time
      @free_time = FreeTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def free_time_params
      params.require(:free_time).permit(:user_id, :day, :timeSlot)
    end
end
