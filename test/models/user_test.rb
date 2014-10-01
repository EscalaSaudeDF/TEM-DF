require 'test_helper'
require 'simplecov'
SimpleCov.start 'rails'

class UserTest < ActiveSupport::TestCase
	test "should not save user without username" do
		@user = User.new(:username => "", :email => "test@test.com", :password => "test", :password_confirmation => "test")
		assert_not @user.save
	end

	test "should not save user without email" do
		@user = User.new(:username => "test", :email => "", :password => "test", :password_confirmation => "test")
		assert_not @user.save
	end

	test "should not save password without password" do
		@user = User.new(:username => "test", :email => "test@test.com", :password => "", :password_confirmation => "")
		assert_not @user.save
	end

	test "should have a unique username" do
		@user1 = User.new(:username => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test")
		@user1.save
		@user2 = User.new(:username => "test", :email => "test1@test.com", :password => "test", :password_confirmation => "test")
		assert_not @user2.save
	end

	test "should have a unique emai" do
		@user1 = User.new(:username => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test")
		@user1.save
		@user2 = User.new(:username => "test1", :email => "test@test.com", :password => "test", :password_confirmation => "test")
		assert_not @user2.save
	end

end
