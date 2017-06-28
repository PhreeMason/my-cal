class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :time, :day, :month_time, :link
  belongs_to :month
end
