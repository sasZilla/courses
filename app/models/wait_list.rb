class WaitList < ActiveRecord::Base
  attr_accessible :course_id, :user_id

  belongs_to :course
  has_and_belongs_to_many :users
end
