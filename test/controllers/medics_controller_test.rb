require 'test_helper'

class MedicsControllerTest < ActionController::TestCase

    fixtures :medics, :work_units, :users, :comments

    def setup
  	    @medic = medics(:one)
        @medic2 = medics(:two)
  	    @work_unit = work_units(:one)
        @user = users(:roberto)
        @user2 = users(:lorena)
        @comment = comments(:one)
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
        get :profile, id: @medic.id

        assert_equal 0, assigns(:ratings)
        assert_equal 0, assigns(:average)
    end

    test "should calculate average 1" do
        session[:remember_token] = @user.id
        post :rating, medic_id: @medic.id, grade: 2, create_rating:{user: @user, medic: @medic}
        session[:remember_token] = @user2.id
        post :rating, medic_id: @medic.id, grade: 3, create_rating:{user: @user2, medic: @medic}
        get :profile, id: @medic.id

        assert_equal 2, assigns(:ratings)
        assert_equal 2.5, assigns(:average)
    end

    test "should create a comment" do
        session[:remember_token] = @user.id
        post :create_comment, medic_id: @medic.id, content: "content test"

        assert_equal "content test", assigns(:comment).content

        assert_redirected_to profile_path(@medic)
    end

    test "shouldn't create a comment" do
        post :create_comment, medic_id: @medic.id, content: "content test"

        assert_redirected_to login_path
    end

    test "should create relevances" do
        session[:remember_token] = @user.id
        post :create_relevance, comment_id: @comment.id, medic_id: @medic.id, value: true

        assert_equal true, assigns(:relevance).value

        post :create_relevance, comment_id: @comment.id, medic_id: @medic.id, value: false

        assert_equal false, assigns(:relevance).value
    end

    test "should update relevance" do
        session[:remember_token] = @user.id
        post :create_relevance, comment_id: @comment.id, medic_id: @medic.id, value: true
        post :create_relevance, comment_id: @comment.id, medic_id: @medic.id, value: false

        assert_equal false, assigns(:relevance).value
    end

    test "shouldn't create relevance with invalid user" do
        post :create_relevance, comment_id: @comment.id, medic_id: @medic.id, value: true
        assert_redirected_to login_path
    end

    test "should report a comment" do
        get :to_report, id: @medic.id, medic_id: @medic.id, comment_id: @comment.id 
        assert_equal true, assigns(:comment).report
    end

    test "should calculate graph" do
        get :workunits_graph
        assert_equal 1, assigns(:unit_name).size
        assert_equal 1, assigns(:medics_size).size
    end

    test "should order medics" do
        get :ranking
        medic = Medic.create(average: 5)
        medic2 = Medic.create(average: 2)
        all = Medic.all        
        assert_operator all.index(medic), :<, all.index(medic2)
    end
end
