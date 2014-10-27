require 'test_helper'

class MedicsControllerTest < ActionController::TestCase
  fixtures :medics, :work_units

  fixtures :users
    
  def setup
      @user = users(:roberto)
      @medic = medics(:one)
      @work_unit = work_units(:one)
  end

  test "should not get results" do
  	get :results, list_specility: "Informe a Especialidade", list_work_unit_name: "Informe a Região"
  	assert_nil @medics 
  	assert_template "home/index"
  end

  test "should get results" do
  	get :results, list_specility: @medic.speciality, list_work_unit_name: @work_unit.name
  	assert_response :success
  end

  test "should get results without speciality" do
  	get :results, list_specility: "Informe a Especialidade", list_work_unit_name: @work_unit.name
  	assert_response :success
  end

  test "should get results without work unit" do
  	get :results, list_specility: @medic.speciality, list_work_unit_name: "Informe a Região"
  	assert_response :success
  end

  test "should get medic profile" do
  	get :profile, id: @medic.id
  	assert_response :success
  end

  test "should create comment" do
    session[:remember_token] = @user.id

    assert_difference('Comment.count') do
      post :create_comment, medic_id: @medic.id, content: "testeee", comment: {date: Time.now, medic: @medic, user: @user, comment_status: true, report: false}
    end 
    assert_redirected_to profile_path(@medic)
  end

  test "shouldn't create comment without user" do
    @user = nil

    post :create_comment, medic_id: @medic.id, content: "testeee", comment: {date: Time.now, medic: @medic, user: @user, comment_status: true, report: false}
    assert_redirected_to login_path
  end

  test "should create relevance" do
    
  end

end
