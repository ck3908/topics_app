class AddAvgRatingToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :avg_rating, :integer
  end
end
