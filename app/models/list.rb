class List < ActiveRecord::Base
  attr_accessible :title, :user

  validates_presence_of :title, :user

  belongs_to :user
  has_many :tasks
end
