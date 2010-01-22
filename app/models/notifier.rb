class Notifier < ActionMailer::Base
  
  def new_work_order_notification(work_order)
    recipients  work_order.ra.map {|ra| ra.email }
    from        "no-reply@unh.edu"
    subject     "New work order submitted"
    body        :work_order => work_order
  end

end
