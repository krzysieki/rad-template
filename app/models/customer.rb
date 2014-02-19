class Customer < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :devices
  has_and_belongs_to_many :playlists
  has_many :fileuploads
end
