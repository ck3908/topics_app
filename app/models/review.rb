class Review < ActiveRecord::Base
  belongs_to :topic
  before_save :rating_check

  # make sure ratings are in a range before save
  def rating_check
    if self.rating > 10
      self.rating = 10
    end
    if self.rating < 1
      self.rating = 1
    end
  end

end
