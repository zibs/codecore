class Skill < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :user_id, presence: true
end
