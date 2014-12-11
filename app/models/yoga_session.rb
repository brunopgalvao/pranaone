class YogaSession < ActiveRecord::Base
  belongs_to :yoga_class
  
  def formatted_date
    session_date.strftime("%^A")
  end
  
  def formatted_time
    Time.parse(session_time).strftime("%l:%M %p")
  end
end
