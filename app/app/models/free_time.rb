class FreeTime < ActiveRecord::Base
  belongs_to :student
  validates :day, :timeSlot, presence: true
  
end
