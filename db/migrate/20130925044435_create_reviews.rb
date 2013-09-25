class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :rating
      t.references :topic, index: true

      t.timestamps
    end
  end
end
