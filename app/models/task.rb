class Task < ApplicationRecord
  has_one :mytask 
  belongs_to :month
end
