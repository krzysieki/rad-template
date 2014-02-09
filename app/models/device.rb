class Device < ActiveRecord::Base
  validates :serial, presence: true
  has_and_belongs_to_many :customers
end
