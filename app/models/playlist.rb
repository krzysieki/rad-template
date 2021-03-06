class Playlist < ActiveRecord::Base
  has_and_belongs_to_many :customers

  validates :name, presence: true, uniqueness: true
end
