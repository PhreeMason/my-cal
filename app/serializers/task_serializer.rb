class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :time
  belongs_to :month
end
