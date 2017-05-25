class Task < ApplicationRecord
  has_one :mytask
  belongs_to :month, optional: false
  accepts_nested_attributes_for :month
  validates :content, presence: true
  validates :start_time, presence: true
  validate :time_cannot_be_in_the_past

  def time_cannot_be_in_the_past
    if !start_time.blank? and start_time < Time.now
      errors.add(:start_time, "can't be in the past")
    end
  end

  def date=(date)
    t = date.values.map(&:to_i)
    time = Time.new(t[0],t[1],t[2],t[3],t[4])
    self.start_time = time
    self.month = Month.find_or_create_by_time(time)
  end

end
