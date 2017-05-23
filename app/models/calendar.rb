class Calendar < ApplicationRecord
  belongs_to :user
  has_many :months
  has_many :tasks, through: :months
  after_create :give_me_months

  def give_me_months
    (0..12).each do |n|
      now = Date.today
      now += n.month
      self.months.create(order: now.month, name: now.strftime("%B"), days: now.end_of_month.day, year: now.strftime("%Y"))
    end
  end

  def add_month(time)
    self.months.create(order: time.month, name: time.strftime("%B"), days: time.end_of_month.day, year: time.strftime("%Y"))
  end
end
