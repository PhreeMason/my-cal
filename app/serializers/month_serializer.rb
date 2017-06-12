class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :days, :first_week_days 
  has_many :tasks
end
