class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :days 
  has_many :tasks
end
