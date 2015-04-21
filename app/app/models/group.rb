class Group < ActiveRecord::Base
	has_many :students
	validates :name, presence: true


	def self.search(query)
	# where(:title, query) -> This would return an exact match of the query
	where("name like ?", "%#{query}%")
	end
end
