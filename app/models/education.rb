class Education < ActiveRecord::Base
  belongs_to :user

  validates :institution, presence: true
  validates :program, presence: true
  validates :user_id, presence: true
end
