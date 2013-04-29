class Partner < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :courses, :dependent => :destroy
end
