class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year
  has_many :tasks
end
