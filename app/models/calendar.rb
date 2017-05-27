class Calendar < ApplicationRecord
  belongs_to :user
  has_many :months
  has_many :tasks
  after_create :give_me_months

  def give_me_months
    (0..12).each do |n|
      now = Date.today
      now += n.month
      self.months << Month.create_from_time(now)
    end
    self.save
  end

  def add_month(time)
    self.months << Month.create_from_time(time)
    self.save
    self.months.last
  end

  def find_month_by_time(time)
    month = self.months.find_by(order: time.month, year: time.strftime("%Y"))
    if month
      month
    else
      self.add_month(time)
    end
  end

  def upcoming_tasks
    tasks = Task.upcoming_for_user(user)
    tasks.chunk_while {|i, j| i.month == j.month }
  end

end
