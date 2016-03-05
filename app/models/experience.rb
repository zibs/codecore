class Experience < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :company, presence: true

  validates :comapny, presence: true
  validates :user_id, presence: true
end
