class Month < ApplicationRecord
  belongs_to :calendar
  has_many :tasks
end
