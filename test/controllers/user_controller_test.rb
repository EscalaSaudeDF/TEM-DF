require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  	fixtures :users
    
    def setup
      @user = users(:roberto)
    end

    test "shouldn't get index" do
  		get :index
        assert_redirected_to root_path
  	end

    test "should get index" do
        @user = users(:admin)
        session[:remember_token] = @user.id
        get :index
        
        assert_response :success
        assert_not_nil assigns(:users)
    end

  	test "should get new" do
  		get :new
  		assert_response :success
  	end

  	test "should create user" do
  		assert_difference('User.count') do
            post :create, user: {username: "test", email: "test@test.com", password: "test", password_confirmation: "test"}
    	end

    	assert_redirected_to root_path(assigns(:user))
  	end

      #linha 15
    test "shouldn't create user" do
        assert_no_difference('User.count') do
            post :create, user: {username: "test", email: "test", password: "test", password_confirmation: "test"}
        end

        assert_template :new
    end

    test "shouldn't create user if passwords are different" do
        assert_no_difference('User.count') do
            post :create, user: {username: "test", email: "test@test.com", password: "test1", password_confirmation: "test" }
        end

        assert_template :new
    end

    test "should create user with document" do
        assert_difference('User.count') do
            post :create, user: {username: "test", email: "test@test.com", password: "test", password_confirmation: "test", 
                document: fixture_file_upload('files/arquivo_medico', 'application/pdf')}
        end

        assert_redirected_to root_path(assigns(:user))
    end

    test "shouldn create user without document if user == false" do
        assert_no_difference('User.count') do
            post :create, user: {account_status: false, username: "test", email: "test@test.com", password: "test", password_confirmation: "test" }
        end
        assert_template :new
    end

    test "should edit user's password" do
        session[:remember_token] = @user.id
        get :edit_password, id: session[:remember_token]
        assert_response :success
    end

    test "should update_password" do
        session[:remember_token] = @user.id 
        put :update_password, id: session[:remember_token], :user => {:username => "Roberto", :password => "1234", :new_password => "4321", :password_confirmation => "4321"}
        assert_equal "4321",  assigns(:user).password
        assert_redirected_to root_path
    end

    test "shouldn't update_password" do
        session[:remember_token] = 0
        put :update_password, id: session[:remember_token]
        assert_redirected_to edit_password_path
    end    

    test "shouldn't update_password with wrong confirmation" do
        session[:remember_token] = @user.id 
        put :update_password, id: session[:remember_token], :user => {:username => "Roberto", :password => "1234", :new_password => "4321", :password_confirmation => "321"}
        assert_redirected_to edit_password_path
    end

    test "should destroy user" do
        assert_difference('User.count', -1) do
            delete :destroy, id: @user.id
        end
        assert_redirected_to(:controller => "users", :action => "index")
    end 

    test "should edit user" do
        session[:remember_token] = @user.id
        get :edit , id: session[:remember_token]
        assert_response :success
    end 

   test "should update user" do
        session[:remember_token] = @user.id
        put :update, id: session[:remember_token], :user => {:username => "Joao", :email => "joao@gmail.com"}
        assert_equal "Joao", assigns(:user).username  
        assert_equal "joao@gmail.com", assigns(:user).email
        assert_redirected_to root_path 
    end 

    test "shouldn't update user with existing username" do
        session[:remember_token] = @user.id
        put :update, id: session[:remember_token], :user => {:username => "Lorena", :email => "lorena@gmail.com"}
        assert_template :edit
    end

    test "shouldn't update user with existing email" do
        session[:remember_token] = @user.id
        put :update, id: session[:remember_token], :user => {:username => "Joao", :email => "lorena@gmail.com"}
        assert_template :edit
    end

    test "shouldn't update user without session" do
        put :update, id: 0
        assert_redirected_to root_path
    end

    test "should reactivate user" do
        @user = users(:lorena) #uses lorena because her account_status is false
        get :reactivate, id: @user.id
        assert_equal true, assigns(:user).account_status
        assert_redirected_to(:controller => "users", :action => "index")
    end

    test "shouldn't reactivate user without session" do
        get :reactivate, id: 0
        assert_redirected_to root_path
    end

    test "should desactivate user" do
        get :desactivate, id: @user.id
        assert_equal false, assigns(:user).account_status
        assert_redirected_to(:controller => "users", :action => "index")
    end

    test "should desactivate user in the current session" do
        session[:remember_token] = @user.id
        get :desactivate, id: @user.id
        assert_equal false, assigns(:user).account_status
        assert_redirected_to logout_path
    end

    test "shouldn't desactivate user without session" do
        get :desactivate, id: 0
        assert_redirected_to root_path
    end


end

