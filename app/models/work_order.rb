class WorkOrder < ActiveRecord::Base
  has_many :notes
  belongs_to :status
  belongs_to :building
  
  validates_presence_of :first_name, :last_name, :phone_number, :building_id, 
                        :room_number, :email, :location_of_problem, :problem
                        
  after_create {|record| record.notify_ra }
                        
  def ra
    User.find_by_building_and_room_number(building, stripped_room_number)
  end
  
  def stripped_room_number
    room_number[/\A(\d+)/].to_i
  end
  
  def notify_ra
    Notifier.deliver_new_work_order_notification(self)
  end
end
