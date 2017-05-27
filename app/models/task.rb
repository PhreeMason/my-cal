class Task < ApplicationRecord
  has_one :mytask
  has_one :user, through: :mytask
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
    binding.pry
    t = date.values.map(&:to_i)
    time = Time.new(t[0],t[1],t[2],t[3],t[4])
    self.start_time = time
    binding.pry
  end

  def self.for_today(month, day)
    joins(:month).where(["name = ? and year = ?", month.name, month.year]).where('start_time > ? and start_time < ?', month.to_time(day), (month.to_time(day) + 1.day)).order("start_time")
  end

end
