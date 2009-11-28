class WorkOrder < ActiveRecord::Base
  has_many :notes
  belongs_to :status
end
