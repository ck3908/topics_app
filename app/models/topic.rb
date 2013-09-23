class Topic < ActiveRecord::Base
  validates_presence_of :title, :content, :sector, :made_by
  validates_uniqueness_of :made_by

end
