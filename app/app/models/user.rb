class User < ActiveRecord::Base
	has_many :free_times
	before_save {self.email = self.email.downcase}
	EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length:{maximum: 30}
	validates :email, presence: true, length: {maximum: 255}, format: {with: EMAIL_EXPRESSION}, uniqueness: { case_sensitive: false}
	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :major, length: {minimum: 3}


	def self.search(query)
	# where(:title, query) -> This would return an exact match of the query
	where("name like ?", "%#{query}%")
	end

end
