class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :time, :day
  belongs_to :month
end
