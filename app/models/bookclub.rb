class Bookclub < ActiveRecord::Base
  has_many :topics, :dependent: :destroy
end

