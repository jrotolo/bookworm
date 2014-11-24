class Topic < ActiveRecord::Base
  belongs_to :bookclub
  has_many :posts, dependent: :destroy
end
