class FreeTime < ActiveRecord::Base
  belongs_to :user
  validates :user, :day, :timeSlot, presence: true
  validates :day, format: {
    with: /\A(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\Z/,
    message: 'must be Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, or Sunday' 
  }
  validates :timeSlot, format: {
    with: /\A(Morning|Afternoon|Evening)\Z/,
    message: 'must be Morning, Afternoon, or Evening'
  }
  validates_uniqueness_of :user, scope: [:day, :timeSlot], 
    message: 'a person cannot enter the same time spot more than once'
end
