class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :calenday       
  has_many :mytasks
  has_many :tasks, through: :mytasks
  # before_save :give_me_calendar

  # def give_me_calendar
  #   if !self.persisted?
  #     self.calendar.create()
  #   end
  # end
end
