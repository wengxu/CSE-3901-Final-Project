class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length:{maximum: 30}
	validates :email, presence: true, length: {maximum: 255}, format: {with: EMAIL_EXPRESSION}, uniqueness: { case_sensitive: false}
end
