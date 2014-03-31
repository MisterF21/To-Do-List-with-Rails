class Task < ActiveRecord::Base
  validates :task, :presence => true
  validates_uniqueness_of :task
  validates_length_of :task, minimum: 5
end
