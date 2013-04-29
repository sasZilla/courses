class Course < ActiveRecord::Base
  attr_accessible :description, :name, :partner_id, :size

  belongs_to :partner
  has_many :wait_lists
  has_and_belongs_to_many :users
end
