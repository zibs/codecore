class Experience < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :comapny, presence: true
  
end
