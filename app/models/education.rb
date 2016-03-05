class Education < ActiveRecord::Base
  belongs_to :user

  validates :institution, presence: true
  validates :program, presence: true
  
end
