class Group < ActiveRecord::Base

	
	has_many :memberships
  	has_many :users, :through => :memberships
	#validate_uniqueness_of :name, :message => "a group already 		exists with that name"
	#validate_presence_of :name
	
end
