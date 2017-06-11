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
    t = date.values.map(&:to_i)
    time = Time.new(t[0],t[1],t[2],t[3],t[4])
    self.month = self.calendar.find_month_by_time(time)
    self.start_time = time
  end

  def self.upcoming_for_user(user)
    tasks = joins(:calendar).where(["calendar_id = ?", user.calendar.id]).where('start_time >= ?', Time.now - 4.hour).order("start_time")
  end
  
  def self.past_task(user)
    tasks = joins(:calendar).where(["calendar_id = ?", user.calendar.id]).where('start_time < ?', Time.now - 4.hour).order("start_time")
  end

  def time
    start_time.strftime("%I:%M %p")
  end
end
