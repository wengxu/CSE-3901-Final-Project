gem "mechanize"
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    if params[:search]
        @users = User.search(params[:search]).order("created_at DESC")

      else
         @users = User.all
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.find(params[:id])
    #to store the user free time info
    @schedule = Array.new(3) {Array.new(7, 0)}
    times = @user.free_times
    days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    timeFrames = ['Morning', 'Afternoon', 'Evening']
    times.each {|t|

      7.times {|day|
	3.times{|timeFrame|
		@schedule[timeFrame][day] = 1 if t.day == days[day] && t.timeSlot == timeFrames[timeFrame]
	}
      }

    }

    # to check if the user exist

    agent = Mechanize.new { |agent| agent.user_agent_alias = "Windows Chrome" }
    searchPage = agent.get('http://www.lolking.net/')
	#search for player with the user name keyword
	searchBox = searchPage.forms.first
	searchBox['name'] = @user.name
	resultPage = searchBox.submit
	resultBody = resultPage.body
	result_doc = Nokogiri::HTML(resultBody)

	@lk = resultPage.uri
	@rank = result_doc.xpath("//li[contains(@class, 'featured')]/div[3]/div[1]").text.strip

# scrape info from website

	if @rank.include? "Bronze"
		@r_img = "bronze.png"
	elsif @rank.include? "Silver"
		@r_img = "silver.png"
	elsif @rank.include? "Gold"
		@r_img = "gold.png"
	elsif @rank.include? "Plat"
		@r_img = "plat.png"
	elsif @rank.include? "Diamond"
		@r_img = "diamond.png"
	elsif @rank.include? "Master"
		@r_img = "master.png"
	elsif @rank.include? "Challenger"
		@r_img = "challenger.png"
	else
		@r_img = "unknown.png"
	end

	if @rank.length > 0
		@pic_url= result_doc.css("div#summoner-titlebar-icon")[0]['style']
		@pic_url.slice!(0, 24)
		@pic_url.slice!(-2,3)

		@pic_url = 'http://' + @pic_url

		if result_doc.at_css("td.lifetime_stats_val")
			@wins = result_doc.css("td.lifetime_stats_val")[0].text
			@kills = result_doc.css("td.lifetime_stats_val")[1].text
			@assists = result_doc.css("td.lifetime_stats_val")[2].text
			@minions = result_doc.css("td.lifetime_stats_val")[3].text
			@jungle = result_doc.css("td.lifetime_stats_val")[4].text
			@turrets =result_doc.css("td.lifetime_stats_val")[5].text
		else
			@wins = "No data available"
			@kills ="No data available"
			@assists = "No data available"
			@minions = "No data available"
			@jungle = "No data available"
			@turrets = "No data available"
		end
	end

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
  	# read in user input from forms so that free time can be stored as well
    @user = User.new(user_params)
    mon =  params.values_at 'monday1', 'monday2', 'monday3'
	mon.each {|x| @user.free_times.build(user_id: @user.id, day: 'Monday', timeSlot: x) if x}

    tue = params.values_at 'tuesday1', 'tuesday2', 'tuesday3'
	tue.each {|x| @user.free_times.build(user_id: @user.id, day: 'Tuesday', timeSlot: x) if x}

    wed = params.values_at 'wednesday1', 'wednesday2', 'wednesday3'
	wed.each {|x| @user.free_times.build(user_id: @user.id, day: 'Wednesday', timeSlot: x) if x}

    thu = params.values_at 'thursday1', 'thursday2', 'thursday3'
	thu.each {|x| @user.free_times.build(user_id: @user.id, day: 'Thursday', timeSlot: x) if x}

    fri = params.values_at 'friday1', 'friday2', 'friday3'
	fri.each {|x| @user.free_times.build(user_id: @user.id, day: 'Friday', timeSlot: x) if x}

    sat = params.values_at 'saturday1', 'saturday2', 'saturday3'
	sat.each {|x| @user.free_times.build(user_id: @user.id, day: 'Saturday', timeSlot: x) if x}

    sun = params.values_at 'sunday1', 'sunday2', 'sunday3'
	sun.each {|x| @user.free_times.build(user_id: @user.id, day: 'Sunday', timeSlot: x) if x}



    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    puts @user.errors[:name].to_s
    puts @user.errors[:email].to_s
    puts @user.errors[:password_digest].to_s
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
# read in user input from forms so that free time can be stored as well
        mon =  params.values_at 'monday1', 'monday2', 'monday3'
  mon.each {|x| @user.free_times.build(user_id: @user.id, day: 'Monday', timeSlot: x) if x}

    tue = params.values_at 'tuesday1', 'tuesday2', 'tuesday3'
  tue.each {|x| @user.free_times.build(user_id: @user.id, day: 'Tuesday', timeSlot: x) if x}

    wed = params.values_at 'wednesday1', 'wednesday2', 'wednesday3'
  wed.each {|x| @user.free_times.build(user_id: @user.id, day: 'Wednesday', timeSlot: x) if x}

    thu = params.values_at 'thursday1', 'thursday2', 'thursday3'
  thu.each {|x| @user.free_times.build(user_id: @user.id, day: 'Thursday', timeSlot: x) if x}

    fri = params.values_at 'friday1', 'friday2', 'friday3'
  fri.each {|x| @user.free_times.build(user_id: @user.id, day: 'Friday', timeSlot: x) if x}

    sat = params.values_at 'saturday1', 'saturday2', 'saturday3'
  sat.each {|x| @user.free_times.build(user_id: @user.id, day: 'Saturday', timeSlot: x) if x}

    sun = params.values_at 'sunday1', 'sunday2', 'sunday3'
  sun.each {|x| @user.free_times.build(user_id: @user.id, day: 'Sunday', timeSlot: x) if x}


    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :major, :campus)
    end
end
