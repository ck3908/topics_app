class Topic < ActiveRecord::Base
  validates_presence_of :title, :content, :sector, :made_by
  validates_uniqueness_of :made_by
  # to destroy a topic, make sure all reviews associated are destroyed
  has_many :reviews, dependent: :destroy

end
