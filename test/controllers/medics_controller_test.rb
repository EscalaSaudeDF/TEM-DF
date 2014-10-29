require 'test_helper'

class MedicsControllerTest < ActionController::TestCase
    fixtures :medics, :work_units, :users

    def setup 
  	    @medic = medics(:one)
  	    @work_unit = work_units(:one)
        @user = users(:roberto)
        @user2 = users(:lorena)
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

  test "should create rating" do
        session[:remember_token] = @user.id
        assert_difference('Rating.count') do
            post :rating, medic_id: @medic.id, grade: 1, crate_rating:{user: @user, medic: @medic}
        end
        assert_equal 1, assigns(:rating).grade
    end

    test "shouldn't create rating" do 
        assert_no_difference('Rating.count') do
            post :rating, medic_id: @medic.id, grade: 1, crate_rating:{user: @user, medic: @medic}
        end
        assert_redirected_to login_path
    end

    test "should update rating" do
        session[:remember_token] = @user.id
        post :rating, medic_id: @medic.id, grade: 1, create_rating:{user: @user, medic: @medic}
        post :rating, medic_id: @medic.id, grade: 2, update_rating: {user: @user, medic: @medic}
        assert_equal 2, assigns(:rating).grade
    end

    test "should calculate average" do
        
    end
    
end
