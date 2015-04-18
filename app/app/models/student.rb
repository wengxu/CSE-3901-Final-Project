class Student < ActiveRecord::Base
	belongs_to :groups
  validates :name, :major, :rank, presence: true
  validates_uniqueness_of :name,
    {message: 'the student name is already entered'}
  validates :name, format: {
    with: /\A[a-zA-Z]/,
    message: 'must start with a character'
  }
  validates :major, format: {
    with: /\A[a-zA-Z]+\Z/,
    message: 'must be a string'
  }

	def self.search(query)
	# where(:title, query) -> This would return an exact match of the query
	where("name like ?", "%#{query}%")
end
end
