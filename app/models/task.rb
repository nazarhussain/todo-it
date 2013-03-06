class Task < ActiveRecord::Base
  PRIORITY_LOW = 1
  PRIORITY_NORMAL = 2
  PRIORITY_MEDIUM = 3
  PRIORITY_HIGH = 4

  PRIORITIES = [
      ['Low', PRIORITY_LOW],
      ['Normal', PRIORITY_NORMAL],
      ['Medium', PRIORITY_MEDIUM],
      ['High', PRIORITY_HIGH]
  ]

  belongs_to :list
  attr_accessible :due_date, :priority, :title, :completed?, :completed

  validates_presence_of :title

  def priority_label
    PRIORITIES.map { |p| return p.first if p.last == self.priority }
  end
end
