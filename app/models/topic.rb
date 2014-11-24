class Topic < ActiveRecord::Base
  belongs_to :bookclub
  belongs_to :user
  has_many :posts, :dependent => :destroy

end
