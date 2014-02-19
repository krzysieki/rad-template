class Fileupload < ActiveRecord::Base
  mount_uploader :dbfile, DbfileUploader
  belongs_to :customer
end
