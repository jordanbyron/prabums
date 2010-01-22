require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :ra, :rd, 
                  :administrator, :service_provider, :building_id, :company, 
                  :coverage_area



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def self.find_by_building_and_room_number(building, room_number)    
    ras = User.find(:all, :conditions => {:building_id => building.id})
    
    ras.reject! {|ra| !ra.covers_room?(room_number) }
    
    ras
  end
  
  def work_orders
    if ra
      WorkOrder.all.reject {|w| !(covers_room?(w.stripped_room_number) && w.building_id == building_id) }
    elsif rd
      WorkOrder.all
    elsif service_provider
      
    elsif administrator
      WorkOrder.all
    end
  end
  
  def covers_room?(room_number)
    range = coverage_area.split(',').delete_if{ |d| !d[/\d+-\d+/] }
    
    ranges = range.map {|r| r.split('-')[0].to_i..r.split('-')[1].to_i}
    
    ranges.each do |r|
      return true if r === room_number
    end
    
    ranges = coverage_area.split(',').delete_if{ |d| d[/\d+-\d+/] }
    
    ranges.each do |r|
      return true if r.to_i == room_number
    end
    
    false
  end

  protected
    


end
