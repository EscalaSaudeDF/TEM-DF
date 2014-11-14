require 'valid_email'
require 'bcrypt'

class User < ActiveRecord::Base
	has_many :comments
	has_many :relevance

	has_one :rating

	attr_accessor :password, :password_confirmation, :new_password, :document
	before_save :encrypt_password

	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true, email: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	validates :new_password, presence: true, :on => [:updatePassword]

	def self.authenticate(username, password)
		user = find_by_username_and_account_status(username,true)

		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
	    if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	    end
  	end

  	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  update_attribute(:password_reset_token , password_reset_token)
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end
end
 
