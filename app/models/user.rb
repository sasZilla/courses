class User < ActiveRecord::Base
  acts_as_authentic

  has_and_belongs_to_many :courses
  has_and_belongs_to_many :wait_lists
end
