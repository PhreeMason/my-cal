class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :time, :day, :month_time
  belongs_to :month
end
