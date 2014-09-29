require 'valid_email'
require 'bcrypt'

class User < ActiveRecord::Base

	has_attached_file :document, styles: {thumbnail: "60x60#"}

	attr_accessor :password, :password_confirmation
	before_save :encrypt_password

	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true, email: true
	validates :password, presence: true
	validates :password_confirmation, presence: true

	def self.authenticate(username, password)

		user = find_by_username(username)

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
end
