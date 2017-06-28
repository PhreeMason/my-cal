class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :all_days, :prev_month_last_days, :next_month_first_days, :order
  has_many :tasks
end
