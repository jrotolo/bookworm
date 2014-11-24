class Bookclub < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :topics, :dependent => :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
end

