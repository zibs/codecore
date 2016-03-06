class Project < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :user_id, presence: true
end
