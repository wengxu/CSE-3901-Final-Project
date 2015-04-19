require 'test_helper'

class FreeTimesControllerTest < ActionController::TestCase
  setup do
    @free_time = free_times(:one)
    @update = {
	user_id: 'Xu Weng',
	day: 'Monday',
	timeSlot: 'Afternoon'
    }
  puts "free time at setup #{FreeTime.count}"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:free_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should create free_time" do
    assert_difference('FreeTime.count') do
      post :create, free_time: {user_id: @free_time.user_id, day: @free_time.day, timeSlot: @free_time.timeSlot } 
      puts "freetime is #{FreeTime.count}"
    end

    assert_redirected_to free_time_path(assigns(:free_time))
  end


  test "should show free_time" do
    get :show, id: @free_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @free_time
    assert_response :success
  end

  test "should update free_time" do
    patch :update, id: @free_time, free_time: @update
    assert_redirected_to free_time_path(assigns(:free_time))
  end

  test "should destroy free_time" do
    assert_difference('FreeTime.count', -1) do
      delete :destroy, id: @free_time
    end

    assert_redirected_to free_times_path
  end
end
