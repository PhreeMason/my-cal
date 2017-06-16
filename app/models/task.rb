class Task < ApplicationRecord
  belongs_to :calendar, optional: false
  belongs_to :month, optional: false
  validates :content, presence: true
  validates :start_time, presence: true
 # validate :time_cannot_be_in_the_past

  def time_cannot_be_in_the_past
    if !start_time.blank? and start_time < (Time.now - 4.hour)
      errors.add(:start_time, "can't be in the past")
    end
  end

  
  def date=(date)
    if date.values[0].length > 0
      t = format_date(date.values)
      time = Time.new(t[0],t[1],t[2],t[3],t[4])
      self.month = self.calendar.find_month_by_time(time)
      self.start_time = time
    end
  end
  
  def format_date(date)
    result = date[0].split('T').join('-').split('-')
    result[3] = result[3].split(':')
    result.flatten.map(&:to_i)
  end

  def self.upcoming_for_user(user)
    tasks = joins(:calendar).where(["calendar_id = ?", user.calendar.id]).where('start_time >= ?', Time.now - 4.hour).order("start_time")
  end
  
  def self.past_task(user)
    tasks = joins(:calendar).where(["calendar_id = ?", user.calendar.id]).where('start_time < ?', Time.now - 4.hour).order("start_time")
  end

  def time
    start_time.strftime("%b %e, %l:%M %p")
  end
  
  def day 
    start_time.day
  end
  
end
