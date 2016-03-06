class Link < ActiveRecord::Base
  has_many :linkings, dependent: :destroy
  has_many :users, through: :linkings



end
